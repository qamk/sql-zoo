-- Basic nested select --> countries with population > Russia (query given by SQL zoo)
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');
      
-- Select GDP per capita for European countries with a higher GDP/capita than UK
SELECT name FROM world
  WHERE gdp/population >
    (SELECT gdp/population FROM world
      WHERE name = 'United Kingdom')
    AND continent = 'Europe';

-- Select name and continent of countries in the same continent as Argentina and Australia
SELECT name, continent FROM world
  WHERE continent IN
    (SELECT continent FROM world
      WHERE name IN ('Argentina', 'Australia'))
ORDER BY name;

-- Select countries in Europe showing the their population relative to the German population in % 
SELECT name,
  CONCAT(
    ROUND(
      population*100/
        (SELECT population FROM world 
          WHERE name = 'Germany')
       , 0)
     , '%') AS 'percentage'
  FROM world 
  WHERE continent = 'Europe';
