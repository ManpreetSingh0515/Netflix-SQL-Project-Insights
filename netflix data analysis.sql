
--- How many Movies vs TV Shows are on Netflix?

SELECT type, 
COUNT(*) AS total_count
FROM netflix_titles
GROUP BY  type;

--Find the total number of titles in the dataset.

SELECT COUNT(*) AS totla_count
FROM netflix_titles;


--Find the top 5 countries with the most Netflix titles.

SELECT country, COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY country
ORDER BY total_titles DESC
LIMIT 5;

--Countries with More Than 100 Titles?

SELECT country, COUNT(*) AS total_titles
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
HAVING COUNT(*) >100
ORDER BY total_titles DESC

--Find the shortest movies

SELECT title, duration
FROM netflix_titles
WHERE type = 'Movie'
ORDER BY CAST
(REPLACE(duration, ' min', '') AS INTEGER) ASC
LIMIT 5;

--Count how many movies and TV shows are in each rating

SELECT rating, type, COUNT (*) AS total
FROM netflix_titles
WHERE rating IS NOT NULL
AND rating  NOT LIKE '%min%'
GROUP BY rating, type
ORDER BY rating, type

-- Find bad rating?

SELECT title, rating
FROM netflix_titles
WHERE rating IS NULL
OR rating LIKE '%min%'

--Find missing country?

SELECT COUNT(*) AS missing_country
FROM netflix_titles
WHERE country IS NULL

-- Titles containing 'Love'

SELECT title
FROM netflix_titles
WHERE title LIKE '%love%'


--Directors starting with A

SELECT DISTINCT director
FROM netflix_titles
WHERE director LIKE '%A%'

--Content growth by year

SELECT release_year, 
COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY release_year
ORDER BY release_year


--Movies Released Before 2000

SELECT title,
release_year
FROM netflix_titles
WHERE type ='Movies'
AND release_year < 2000
ORDER BY release_year















