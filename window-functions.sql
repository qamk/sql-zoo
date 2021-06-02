/* Using 2015 and 2017 UK General Election results */

-- Select the year, party, votes and each person's rank within the year they ran (2015 or 2017) as determined by the number of votes they received
SELECT yr,party, votes,
  RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
  FROM ge
  WHERE constituency = 'S14000021'
  ORDER BY party,yr;

-- Select the constituency, party, votes and rank for within each constituency in Edinburgh as determined by the number of votes they received
SELECT constituency,party, votes,
  RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) 'posn'
  FROM ge
  WHERE 
    constituency BETWEEN 'S14000021' AND 'S14000026'
    AND yr  = 2017
  ORDER BY posn, constituency;
  
  /* Using Covid19 data (from Rodrigo Pombo) */
  -- Select name, day (1, 2, 3 etc.), confirmed cases and the previous day's confirmed cases Italy
  SELECT name, DAY(whn), confirmed,
   LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)
 FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3
ORDER BY whn;
