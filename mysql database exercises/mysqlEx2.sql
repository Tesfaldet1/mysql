# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
 select *from city 
 where name like "ping%" order  by Population asc;
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
select *from city 
 where name like "ran%" order  by Population desc;
#
#
# 3: Count all cities
select count(*)  AS "Countn all cities"
from city;

# 4: Get the average population of all cities
SELECT AVG(Population) as Avg_Value
   FROM city;

#
# 5: Get the biggest population found in any of the cities
select max( population) as 
max_population from city;
#
# 6: Get the smallest population found in any of the cities
select min(Population) as minimum_Po 
from city;
#
#
# 7: Sum the population of all cities with a population below 10000
select sum(Population) as sum from city
where Population<10000;

#
#
# 8: Count the cities with the countrycodes MOZ and VNM
select count(CountryCode) as count
 from city where 
 CountryCode in("MOZ ", "VNM");
 
 SELECT count(*) FROM city WHERE countrycode IN ("moz","VNM");


# 9: Get individual count of cities for the countrycodes MOZ and VNM
SELECT countrycode,count(*) FROM city 
WHERE countrycode IN("moz","VNM") GROUP BY countrycode;

#
# 10: Get average population of cities in MOZ and VNM
select countrycode, avg(Population) as average
 from city where 
 CountryCode in("MOZ ", "VNM") GROUP BY countrycode;

#
# 11: Get the countrycodes with more than 200 cities

SELECT countrycode,count(*) citycount FROM city
 GROUP BY countrycode HAVING citycount>200;

#
# 12: Get the countrycodes with more than 200 cities ordered by city count
SELECT countrycode,count(*) citycount FROM city
 GROUP BY countrycode HAVING citycount>200 ORDER BY citycount;
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
select*from countrylanguage;
select *from city;

select city.Population, countrylanguage.Language from 
countrylanguage inner join city  on countrylanguage.Percentage = city.ID
where Population between 400 and 500 ;
SELECT language FROM city
 INNER JOIN countrylanguage USING (CountryCode) 
 WHERE population BETWEEN 400 AND 500;

select c.Population, cl.Language from 
countrylanguage cl join city c  on cl.IsOfficial = c.ID
where Population between 400 and 500 ;

# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
select city.Population,city.Name, countrylanguage.Language from 
countrylanguage join city  on countrylanguage.Percentage = city.ID
where city.Population between 120000 and 1780000 ;
#
SELECT name,language FROM city 
INNER JOIN countrylanguage
 ON city.countrycode=countrylanguage.countrycode
 WHERE population BETWEEN 500 AND 600;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
select * from country;
select country.Population, country.Name, c.Population,c.Name  from 
country inner join city c  on country.Population = c.Population
where c.Population = "270000";

SELECT c2.name FROM city c1,city 
c2 WHERE c1.countrycode=c2.countrycode
 AND c1.population=122199;
 

#
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
select 
country.Population, country.Name, c.Population,c.Name  
from country inner join city c  on country.Population = c.Population
where c.Population != "270000";
#
# 17: What are the city names in the country where Luanda is capital?

select 
 c.Name as country , country.Name as city  from 
city c join country on c.ID = country.Capital
where c.Name= "Luanda";

SELECT nc.name FROM city yc,country c,city nc 
WHERE yc.name="luanda" 
AND yc.id=c.capital 
AND c.code=nc.countrycode;



#
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
select 
 c.Name as city , country.Name as country  from 
city c join country on c.ID = country.Capital
where c.Name= "Yaren";

SELECT oci.name FROM
 city yci,country yco,country oco,city oci 
 WHERE yci.name="Yaren" 
AND yci.id=yco.capital
 AND yco.region=oco.region 
 AND oco.capital=oci.id;

#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
SELECT DISTINCT language FROM 
city,country cc,country rc,countrylanguage cl WHERE city.name="riga"
 AND city.countrycode=cc.code 
 AND cc.region=rc.region 
 AND rc.code=cl.countrycode;

  


# 20: Get the name of the most populous city
select Name,max( population) as
max_population   from city order by Name;
#
SELECT name FROM city
tc WHERE tc.population=(SELECT max(population) FROM city);
SELECT cc.name,cc.population,max(mc.population)
 mp FROM city cc,city mc GROUP BY cc.name HAVING cc.population=mp;
