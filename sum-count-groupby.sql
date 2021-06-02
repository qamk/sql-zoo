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
