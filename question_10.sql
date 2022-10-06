					
WITH year_count AS (SELECT playerid, COUNT(DISTINCT(yearid)) AS total_years
					FROM batting
					GROUP BY playerid),
  career_high_hr AS (SELECT playerid, yearid, max(hr) AS hr_count
					 FROM batting
					 GROUP BY playerid, yearid),
  year_count_10 AS (SELECT b.playerid, ch.hr_count
				    FROM batting AS b
				    INNER JOIN year_count AS yc
				    USING(playerid)
					INNER JOIN career_high_hr AS ch
					on b.playerid = ch.playerid
						 AND b.yearid = ch.yearid
				    WHERE yc.total_years >= 10
				    	AND ch.yearid = 2016
					GROUP BY b.playerid, ch.hr_count)
SELECT p.namefirst, p.namelast, y.hr_count
FROM year_count_10 AS y
INNER JOIN people AS p
USING(playerid)





