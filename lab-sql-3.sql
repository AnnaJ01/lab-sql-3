-- How many distinct (different) actors' last names are there?

select *
from sakila.actor;

select count(distinct last_name) as actors_names
from sakila.actor;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)

select *
from sakila.film;

select count(distinct language_id) as original_language
from sakila.film;


-- How many movies were released with "PG-13" rating?

select count(*) as pg_13_movies
from sakila.film
where rating = 'PG-13';


-- Get 10 the longest movies from 2006.


select *
from sakila.film
where release_year = 2006
order by length desc
LIMIT 10;



-- How many days has been the company operating (check DATEDIFF() function)?

select *
from sakila.rental;


select MAX(rental_date), MIN(rental_date)
from sakila.rental;


SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS days_operating
FROM sakila.rental;



-- Show rental info with additional columns month and weekday. Get 20.


select *,
DATE_FORMAT(CONVERT(rental_date, DATE), '%m') AS MONTH_,
dayname(rental_date) AS rental_weekday
from sakila.rental
limit 20;



-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select *,
CASE 
	WHEN DAYOFWEEK(rental_date) = 1 OR DAYOFWEEK(rental_date) = 7 THEN 'weekend'
    ELSE 'workday'
END AS day_type
from sakila.rental;


-- How many rentals were in the last month of activity?

SELECT MAX(DATE_FORMAT(rental_date, '%Y-%m')) AS last_month
FROM sakila.rental;


select *
from sakila.rental;



SELECT COUNT(*)
FROM sakila.rental
WHERE DATE_FORMAT(rental_date, '%Y-%m') = '2006-02';



