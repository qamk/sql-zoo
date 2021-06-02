-- Select using SUM
SELECT SUM(population) FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- Select using COUNT and GROUP BY
SELECT continent, COUNT(*) '# countries' FROM world
GROUP BY continent;

SELECT continent, COUNT(*) 'population >= 10^7' FROM world
WHERE population >= 10000000
GROUP BY continent;

-- Select using GROUP BY and HAVING
SELECT continent FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;

/* NOBEL TABLE */
-- Selecting the number of different winners per subject
SELECT subject, COUNT(DISTINCT winner) '# winners' FROM nobel
GROUP BY subject;

-- Selecting the number of years with awards
SELECT subject, COUNT(DISTINCT yr) FROM nobel
GROUP BY subject;

-- Selecting winners with more than one prize
SELECT DISTINCT winner FROM nobel
GROUP BY winner
HAVING COUNT(winner) > 1;

-- Selecting year and subject with more than 3 prizes given after 2000 (inclusive)
SELECT yr, subject FROM nobel
WHERE yr >= 2000
GROUP BY yr, subject
HAVING COUNT(winner) = 3;
