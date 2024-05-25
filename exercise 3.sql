-- Select all the actors with the first name ‘Scarlett’.
Select first_name from sakila.actor
where first_name= 'scarlett'

-- Select all the actors with the last name ‘Johansson’
Select last_name from sakila.actor
where last_name= 'Johansson'

-- How many films (movies) are available for rent?
select  count(film_id) from sakila.inventory

-- How many films have been rented?
select count(distinct(inventory_id)) from sakila.rental

-- What is the shortest and longest rental period?

--This was my orginal guess on how to calcute this answer but  because since there is a date and a time I believe that sql could not give me a proper value. 
select rental_date,return_date,,min(convert((return_date-rental_date),date)) as Minimum RentalTime, max(convert((return_date-rental_date),date)) as Maximum RentalTime
from sakila.rental

--When looking with chatGPT , i understood that there is a function to calculate this for us:
Select
MIN(TIMESTAMPDIFF(minute, rental_date, return_date)) AS shortest_rental_period_minutes,
MAX(TIMESTAMPDIFF(minute, rental_date, return_date)) AS longest_rental_period_minutes
from sakila.rental

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
Select min(length) as min_duration from sakila.film 

Select max(length)as max_duration from sakila.film 

-- What's the average movie duration?
Select avg(length) as average_duration from sakila.film 

-- What's the average movie duration expressed in format (hours, minutes)?
Select avg(length) as average_duration_in_minutes,
    FLOOR(AVG(length) / 60) as hours,
    AVG(length) % 60 as minutes,
      CONCAT(FLOOR(AVG(length) / 60), ' hours, ', AVG(length) % 60, ' minutes') as average_duration
from sakila.film;

-- How many movies longer than 3 hours?
select  count(film_id) from sakila.film
where length>180

-- Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
select first_name,last_name, 
concat(first_name,".",last_name,"@sakilacustomer.orf") as correct_email_format
from sakila.customer

-- What's the length of the longest film title?
select max(length(title))
from sakila.film
--
