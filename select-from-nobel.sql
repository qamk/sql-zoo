-- Select using BETWEEN
SELECT * FROM nobel
WHERE subject = 'Literature'
AND yr BETWEEN 1980 AND 1989;

-- Select with some boolean logic
SELECT * FROM nobel
WHERE
(subject = 'Medicine' AND yr <1910)
OR (subject = 'Literature' AND yr >= 2004);

-- ORDER BY with two columns
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner;

-- ORDER BY using boolean values --> subject IN (a, b) will result in 0s and 1s which can be sorted 
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject,winner;
 
