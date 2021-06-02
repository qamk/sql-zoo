-- Select the services connecting the stops Craiglockhart and Tollcross
SELECT a.company, a.num FROM route a
  JOIN route b
    ON a.company = b.company
    AND a.num = b.num
  JOIN stops astop
    ON a.stop = astop.id
  JOIN stops bstop
    ON b.stop = bstop.id
  WHERE astop.name = 'Craiglockhart' AND bstop.name = 'Tollcross'
  
 -- Select DISTINCT stops reachable from Craiglockhart (incl. itself)
SELECT DISTINCT stopb.name, a.company, a.num FROM route a
  JOIN route b
    ON a.company = b.company AND a.num = b.num
  JOIN stops stopa
    ON a.stop = stopa.id
  JOIN stops stopb
    ON b.stop = stopb.id
  WHERE stopa.name = 'Craiglockhart'
