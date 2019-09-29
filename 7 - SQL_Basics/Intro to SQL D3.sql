use world;

-- get current date
SELECT CURDATE() AS Today_date; 

-- get addtime difference from current_timestamp() and specified added time
SELECT CURRENT_TIMESTAMP()
AS time_now, ADDTIME(CURRENT_TIMESTAMP(), "2:10:20") AS new_time;

-- get gat difference
SELECT DATEDIFF("20190912", "20190913") AS date_difference;
 
 -- get last day
 SELECT LAST_DAY("20190912") AS last_day;
 -- return day
 SELECT DAYNAME("20190912");
 
 -- extract day from long date format
 SELECT EXTRACT(DAY FROM "20190915 22:22:19") AS day;
 
 -- cast string to date format
 SELECT CAST("20170921" AS DATE) AS date;
 
 -- convert a number to a string using CONVERT(#, CHAR) 
 SELECT CONVERT(150, CHAR) AS int_to_char;
 
 -- get min of lifeexpectancy
 SELECT MIN(lifeexpectancy)
AS least_life FROM country;

-- get the max lifeexpectancy
SELECT MAX(lifeexpectancy)
AS max_life FROM country;

-- get average
SELECT AVG(lifeexpectancy)
AS average_life FROM country;

-- get sum
SELECT SUM(population)
AS total_population FROM city;

-- get count
SELECT COUNT(indepyear) AS number_independent_countries FROM country;

-- get distinct count
SELECT COUNT(DISTINCT indepyear) AS number_distinct_indepyear FROM country;

-- get max with calculation
Select max(GNPold - GNP) from country;

-- group by
SELECT MIN(population) AS least_population, countrycode FROM City
GROUP BY CountryCode;

-- group by more than one column  and count 
SELECT CountryCode, District, count(Name) FROM city
GROUP BY countrycode, district;

-- use WITH ROLLUP to get aggregate with NULLs
SELECT CountryCode, District, 
COUNT(Name) FROM city ­­ 
GROUP BY countrycode, district WITH ROLLUP;

-- use expression with group by
SELECT (GNP - GNPOld) AS GNP_Diff,
COUNT(*) Total_number FROM country
GROUP BY (GNP - GNPOld);

-- using HAVING to filter out population then grouping
SELECT MIN(population), name, countrycode
FROM city GROUP BY countrycode, name
HAVING MIN(population) > 30000;

-- complex query
SELECT COUNT(language), countrycode FROM countrylanguage
WHERE IsOfficial != 'T' -- remobe values from count if True
GROUP BY countrycode -- group
HAVING COUNT(language) > 1 ORDER BY COUNT(language) DESC; -- filter out from grouping based on count

-- use IN to perform uncorelated query to get contries where languge is both english and spanish
SELECT DISTINCT countrycode FROM countrylanguage ­­ 
WHERE Language = 'English'
AND
countrycode IN
(SELECT countrycode FROM countrylanguage WHERE Language = 'Spanish');

-- use NOT IN to perform uncorelated query to get contries where languge is not in Both english and spanish
SELECT DISTINCT countrycode FROM countrylanguage ­­
WHERE Language = 'English'
AND
countrycode NOT IN
(SELECT countrycode FROM countrylanguage WHERE Language = 'Spanish');

-- Find the names of all cities whose population is greater than that of all cities of the USA. using ALL for only TRUE 
SELECT name FROM city 
where population > ALL
(SELECT population FROM city WHERE countrycode = 'USA');

-- Find the official languages of the country using ANY 
SELECT Language, countrycode FROM countrylanguage -- outer query
 WHERE          -- comparision call
 language = ANY(SELECT Language FROM countrylanguage WHERE IsOfficial = 'T'); -- inner query to get offical language
 
 -- Find all the countries that speak both English and Spanish. using EXIST clause from subquery
SELECT countrycode FROM countrylanguage AS A
WHERE language = 'English' 
AND EXISTS
(SELECT * FROM countrylanguage AS B WHERE language = 'Spanish' AND A.countrycode = B.countrycode);

-- Find all the countries that speak both English but not Spanish. using NOT EXIST clause from subquery
SELECT countrycode FROM countrylanguage AS A WHERE language = 'English'
AND NOT EXISTS
(SELECT * FROM countrylanguage AS B
WHERE language = 'Spanish' AND A.countrycode = B.countrycode);

-- nest query on WHERE using select and setting comparision
SELECT c.name FROM country AS c 
WHERE
	(SELECT COUNT(cl.language) FROM countrylanguage AS cl
WHERE c.code = cl.countrycode) < 2;
 
 -- used Nested SELECT to fill a column
SELECT Name, population,((SELECT MAX(population) FROM city) - population) AS population_difference
FROM city
order by population_difference;

-- INNER JOIN to a query to define a table to reference in nested query
SELECT c.code, c.name, cl.Number_of_languages
FROM country AS c
INNER JOIN
(SELECT countrycode, COUNT(*) AS Number_of_languages FROM countrylanguage GROUP BY countrycode) AS cl
ON c.code = cl.countrycode;

-- Create a view with column name aliases
CREATE VIEW Independent_Country_Details
(country_name, country_area,country_population, country_official_language) AS
	SELECT c.Name, c.surfaceArea, c.population, cl.language 
    FROM country AS c, countrylanguage AS cl
	WHERE cl.isOfficial = 'T' and cl.countrycode = c.code;
    
-- update or replace abocve view
CREATE OR REPLACE VIEW Independent_Country_Details
(country_name, country_population_per_area, country_official_language) AS 
	SELECT c.Name, (c.population/c.surfaceArea), cl.language
	FROM country AS c, countrylanguage AS cl
	WHERE cl.isOfficial = 'T' and cl.countrycode = c.code;
    
-- update information using a view
UPDATE Independent_Country_Details
SET country_official_language = 'English/Albanian' 
WHERE country_name = 'Albania';

-- delete a view
DROP VIEW Independent_Country_Details;

-- add index to table columns
ALTER TABLE country ADD INDEX country_name_idx(name);
-- show index
SHOW INDEX FROM country;

-- drop an index
ALTER TABLE country DROP INDEX country_name_idx; 

-- Start a transaction and update Latin as one of the languages in USA with 0.1%. 
-- Update Greek as another language spoken with 0.02%.
­­-- Now we found that Greek language information is false, so rollback to the previous change.

SET AUTOCOMMIT = 0;
START TRANSACTION;
SAVEPOINT my_savepoint;
INSERT INTO countrylanguage VALUES('USA', 'Latin', 'F', 0.1); -- insert a row into countrylanguage SAVEPOINT after_latin_addition_savepoint; ­­ check a savepoint
INSERT INTO countrylanguage VALUES('USA', 'Greek', 'F', 0.02); -- insert another row
ROLLBACK TO SAVEPOINT after_latin_addition_savepoint; -- rollback to the previous savepoint COMMIT; ­­ commit the work

-- show databases
Show databases;

-- show tables from database
SHOW TABLES FROM world;

-- show columns from table 
SHOW COLUMNS FROM world.city;

-- get information schema of data on table level
SHOW TABLES FROM INFORMATION_SCHEMA;

-- get information schema of data on column level
SHOW COLUMNS FROM INFORMATION_SCHEMA.tables;

-- get specific information schema
SELECT table_name, table_type FROM INFORMATION_SCHEMA.tables 
WHERE table_schema = 'world';

use world;
call Show_US_city;