--Question 7 
--What is the largest number of wins for a team that DID NOT win the world series?
SELECT name as team_name, WSWin, yearid, w as wins
FROM teams
WHERE WSWin ='N' AND yearid BETWEEN 1970 AND 2016
ORDER BY wins DESC
LIMIT 1;
--The Seattle Mariners had 116 wins in 2001 and they didn't win the world series.

--What is the smallest number of wins for a team that DID win the world series?
SELECT name as team_name, WSWin, yearid, w as wins
FROM teams
WHERE WSWin ='Y' AND yearid BETWEEN 1970 AND 2016 
ORDER BY wins ASC
LIMIT 1;
--The Los Angeles Dodgers had 63 wins in 1981 and they won the world series.

--Redo without the problem year
SELECT name as team_name, WSWin, yearid, w as wins
FROM teams
WHERE WSWin ='Y' AND yearid BETWEEN 1970 AND 2016 AND yearid<>1981
ORDER BY wins ASC
LIMIT 1;
--There was a baseball strike in 1981. Removing the year 1981 shows the St. Louis Cardinals with 83 wins and winning the world series. 

SELECT name as team_name, wswin, yearid, w as wins 
FROM teams
WHERE yearid BETWEEN 1970 AND 2016
AND wswin = 'Y'
ORDER BY yearid DESC;

