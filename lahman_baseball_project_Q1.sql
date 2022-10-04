SELECT yearid
FROM allstarfull;

SELECT yearid
FROM batting
ORDER BY yearid DESC;

SELECT year
FROM homegames
ORDER BY year DESC;

SELECT DISTINCT MIN(yearid) AS first_year,
				MAX(yearid) AS last_year
FROM teams;
