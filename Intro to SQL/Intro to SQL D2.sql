-- use world.sql database
Use World;
-- select all cities
SELECT * FROM City;

-- To select specific columns.
SELECT Name, Population FROM city;


SELECT ID, 
'City_population', -- create new column
Population/100, -- perform division on Population
LOWER(CountryCode) FROM city; -- convert Country Code to lowercase

-- select language from countrylanguage
 SELECT Language FROM countrylanguage;

-- select distinct languages
 SELECT DISTINCT Language FROM countrylanguage;
 
 -- select from city table and asigning aliases
 SELECT ci.Name AS city_name, 
 ci.District AS city_district 
 FROM city AS ci;
 
 -- using where to filter results against IsOffical and Percentage Columns
 SELECT * FROM countrylanguage ­­ 
WHERE IsOfficial = 'T' AND Percentage > 70;

-- using where, between, and to filter results
SELECT Name, Population FROM city
WHERE population BETWEEN 180000 AND 190000;
-- using WHERE and IN to filter only USA, AUS, IND
SELECT * FROM countrylanguage
WHERE CountryCode IN ('USA', 'AUS', 'IND');

-- using ORDER BY to sort Ascending order on Population
SELECT * FROM city ORDER BY Population;
-- using ORDER BY, DESC to sort Descending
SELECT * FROM city ORDER BY Population DESC;
-- using ORDER BY RIGHTcharacter position 1 on Name
SELECT Name, IndepYear FROM country
ORDER BY RIGHT(Name, 1);
-- using ORDER BY on column index for multiple values
SELECT * FROM city ORDER BY 5, 3;

-- select NULL values
SELECT Name, IndepYear FROM country 
WHERE IndepYear IS NULL;
-- select NOT NULL values
SELECT Name, IndepYear FROM country 
WHERE IndepYear IS NOT NULL;

-- create new schema
CREATE schema shipping;

-- using shipping db
Use shipping;

-- select specific columns w/ matching records from both Orders and Customer tables
SELECT cu.customer_id AS customer_customer_id, 
cu.customer_name, cu.customer_city, o.customer_id AS orders_customer_id, o.orders_id, o.item_id
FROM customer AS cu -- give alias to customer table 
INNER JOIN orders AS o ON cu.customer_id = o.customer_id; -- inner join on customer_id, using alias to orders table

-- select specific columns w/ matching records from Orders only and respective Customer columns
SELECT cu.customer_id AS customer_customer_id, cu.customer_name,
 cu.customer_city, o.customer_id AS orders_customer_id, o.orders_id, o.item_id
FROM customer AS cu -- give alias to customer table 
LEFT JOIN orders AS o ON cu.customer_id = o.customer_id; -- Left outer join on customer_id, using alias to orders table

-- select specific columns w/ matching records from Customer only and respective order columns
SELECT cu.customer_id AS customer_customer_id, cu.customer_name, 
cu.customer_city, o.customer_id AS orders_customer_id, o.orders_id, o.item_id
FROM customer AS cu -- give alias to customer table 
RIGHT JOIN orders AS o ON cu.customer_id = o.customer_id; -- Left outer join on customer_id, using alias to orders table

-- use world db
USE world;
-- ANSI Join command
SELECT cl.CountryCode, c.Name, cl.Language -- Select columns from two tables
FROM country AS c, countrylanguage AS cl -- from two tables w/ alias
WHERE cl.CountryCode = c.Code; -- joining on countryCode = code

-- ANSI Join command for 2+ tables
SELECT ci.Name, co.Name, cl.Language  -- Select columns from three tables
FROM city AS ci, country AS co, countrylanguage AS cl -- from three tables w/ alias
WHERE ci.CountryCode = co.Code -- joining on countryCode = code from two tables here 
AND co.Code = cl.CountryCode; -- adding another join match from the other table

-- Self Join 
SELECT a.Name AS city_1, -- select the same column twice and country code 
b.Name AS city_2, 
a.CountryCode
FROM city a, city b -- select from column
WHERE a.CountryCode = b.CountryCode; -- join on matching country codes

-- select values not matching from both tables
SELECT c1.Name AS city_1, -- selected columns1 with alias
c1.CountryCode as country_1,
 c2.Name as city_2,     -- selected columns2 with alias
 c2.CountryCode as country_2
FROM city c1 INNER JOIN city c2 -- select from two seperate columns 
ON c1.CountryCode != c2.CountryCode; -- explicit not found in together

-- Select UNION of two tables that is common
SELECT code from country
UNION
SELECT CountryCode from countrylanguage;

-- using INION ALL to get all values from both tables
SELECT code from country
UNION ALL
SELECT CountryCode from countrylanguage;

-- use wildcard % to find all records in district that begin with 'K'
SELECT * FROM city WHERE District LIKE 'K%';

-- use wildcard % to find all records in district that begin with any character followed by 'u' any characters in between and ends in 't'
SELECT * FROM city WHERE District LIKE '_u%t';

-- length of language string values 
SELECT Language, LENGTH(Language) AS length_language 
FROM countrylanguage;
 
 -- combine two column strings together using concatenate
SELECT ID, CONCAT_WS("-­", Name, District) AS location, countrycode FROM city;

-- replace characters in a string
SELECT REPLACE(countrycode, 'AFG', 'AF') AS countrycode from city;

-- return a partial string from a value
SELECT SUBSTR(region, 1, 3) -- value, string start, end
AS region_code FROM country;

-- locate a particular character or string within a string type, returns position
SELECT LOCATE('a', district)
AS position_of_a, district FROM city;

-- compares strings as 0, 1, -1, NULL (equal, first<second, first>second, one of strings is NULL)
SELECT STRCMP(GNP, GNPOld) AS compared FROM country;

-- get the modulus of polulation/10 
SELECT MOD(population, 10)
AS population_rem_10, population FROM city;

-- get the 3rd power of surface area
SELECT POW(SurfaceArea, 3)
AS Surface_area_cube, SurfaceArea FROM country;

-- Sqaure root of surface area
SELECT SQRT(SurfaceArea)
AS Surface_area_squareroot, SurfaceArea FROM country;

-- finds log of number
SELECT LOG(GNP) AS GNP_log, GNP FROM country;

-- get rounded ceiling
SELECT CEIL(LifeExpectancy), LifeExpectancy FROM country;

-- get rounded floor
SELECT FLOOR(LifeExpectancy), LifeExpectancy FROM country;

-- truncate to 2 decimal points
SELECT TRUNCATE(GNP / 1000, 2), GNP from country;

-- round number
SELECT ROUND(GNP / 1000, 2), GNP from country;

-- get the absolute value
 SELECT ABS(GNP­GNPOld), GNP, GNPOld FROM country;
 