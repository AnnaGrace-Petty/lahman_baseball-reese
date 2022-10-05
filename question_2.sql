SELECT *
FROM people ;

WITH shortest_player AS (SELECT playerid, namefirst, namelast, min(height) AS height
						 FROM people
						 GROUP BY playerid, namefirst, namelast
						 ORDER BY height asc
						 LIMIT 1)
SELECT s.namefirst, s.namelast, s.height, a.g_all AS total_games, t.name AS team
FROM appearances AS a
INNER JOIN shortest_player AS s
USING(playerid)
INNER JOIN teams AS t
USING(teamid)
GROUP BY s.namefirst, s.namelast, s.height, total_games, team ;
