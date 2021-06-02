-- Selecting the GDP per capita using expressions
SELECT name, (GDP/population) AS 'gdp/capita' FROM world
WHERE population >= 200000000;

-- Population in millions again with expressions
SELECT name, (population/1000000) AS 'population (millions)' FROM world
WHERE continent = 'South America';

-- Use of IN
SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy');

-- Use of LIKE
SELECT name FROM world
WHERE name LIKE '%United%';

-- Using function ROUND
SELECT name, ROUND(population/1000000, 2) AS 'population/mil', ROUND(gdp/1000000000, 2) AS 'gdp (bil)' FROM world
WHERE continent = 'South America';

SELECT name, ROUND(gdp/population, -3) AS 'gdp/capita' FROM world
WHERE gdp >= 1000000000000;
