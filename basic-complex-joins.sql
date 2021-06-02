/* Table Info
game table:                |  goal table:                       |  eteam table:
  PK  id                   |    PK, FK  matchid                 |    PK  id
      mdate (match date)   |    FK      teamid                  |        teamname 
      stadium              |            player (name)           |        coach
  FK  team1                |    PK      gtime  (goal time)      |
  FK  team2                |                                    |
*/
-- Select player and game information for every German goal
SELECT player,teamid, stadium, mdate FROM game
  JOIN goal
    ON (id=matchid)
  WHERE teamid = 'GER';

-- Select player and team info for goals scored within 10 mins
SELECT player, teamid, coach, gtime FROM goal
  JOIN eteam
    ON teamid = id
  WHERE gtime<=10;

-- Select players that scored against Germany
SELECT DISTINCT player FROM game
  JOIN goal
    ON matchid = id 
  WHERE
    (team1 = 'GER' OR team2 = 'GER')
    AND teamid != 'GER';
    
-- Select goals scored per stadium
SELECT stadium, COUNT(matchid) FROM game
  JOIN goal
    ON matchid = id
  GROUP BY stadium;

-- Select date and number of goals for Germany per game
SELECT matchid, mdate, COUNT(matchid) 'goals' FROM game
  JOIN goal
    ON matchid = id
  WHERE teamid = 'GER'
  GROUP BY matchid, mdate;

-- Select the date, each team's respective goals for that game
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) score2
FROM game
  LEFT JOIN goal
    ON matchid = id
  GROUP BY mdate, team1, team2
  ORDER BY mdate,matchid,team1,team2
