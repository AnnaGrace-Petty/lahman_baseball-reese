--Q9
/* Which managers have won the TSN Manager of the Year award in both the National League (NL) 
and the American League (AL)? Give their full name and the teams that they were managing when 
they won the award.*/
WITH nl_winners AS (SELECT a.playerid, p.namefirst, p.namelast, a.yearid, m.teamid, t.name
					FROM awardsmanagers AS a
				    INNER JOIN people AS p
				    USING(playerid)
					INNER JOIN managers AS m
					ON a.playerid = m.playerid
					 AND a.yearid = m.yearid
					INNER JOIN teams AS t
					ON m.teamid = t.teamid
					 AND a.yearid = t.yearid
				    WHERE a.awardid = 'TSN Manager of the Year'
				     AND a.lgid = 'NL'),
     al_winners AS (SELECT a.playerid, p.namefirst, p.namelast, a.yearid, m.teamid, t.name
					FROM awardsmanagers AS a
				    INNER JOIN people AS p
				    USING(playerid)
					INNER JOIN managers AS m
					ON a.playerid = m.playerid
					 AND a.yearid = m.yearid
					INNER JOIN teams AS t
					ON m.teamid = t.teamid
					 AND a.yearid = t.yearid
				    WHERE a.awardid = 'TSN Manager of the Year'
				     AND a.lgid = 'AL')
SELECT n.playerid, n.namefirst, n.namelast, n.yearid AS nl_year, n.name as team, a.yearid AS al_year, a.name AS team
FROM nl_winners AS n
INNER JOIN al_winners AS a
USING(playerid);