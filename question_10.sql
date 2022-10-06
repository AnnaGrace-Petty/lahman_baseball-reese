					
WITH year_count AS (SELECT playerid, COUNT(DISTINCT(yearid)) AS total_years
					FROM batting
					GROUP BY playerid),
  career_high_hr AS (SELECT playerid, max(hr) AS hr_count
					 FROM batting 
					 WHERE hr > 0
					 GROUP BY playerid),
  year_count_10 AS (SELECT b.playerid, b.hr
				    FROM batting AS b
				    INNER JOIN year_count AS yc
				    USING(playerid)
				    WHERE yc.total_years >= 10
				    	AND b.yearid = 2016)
SELECT p.namefirst, p.namelast, y.hr
FROM year_count_10 AS y
INNER JOIN people AS p
USING(playerid)
INNER JOIN career_high_hr
USING(playerid)
WHERE career_high_hr.hr_count = y.hr





