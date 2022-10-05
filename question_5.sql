--AVERAGE NUMBER STRIKEOUTS PER GAME BY DECADE


WITH games_by_count AS (SELECT year, sum(games) as game_count
						FROM homegames
			            GROUP BY year
					    ORDER BY year ASC),
	so_by_count AS (SELECT yearid, sum(so::numeric) AS so_count
				    FROM pitching
				    GROUP BY yearid
				    ORDER BY yearid ASC)
SELECT 
	  CASE WHEN year >= 1920 AND year <= 1929 THEN '1920s'
		   WHEN year >= 1930 AND year <= 1939 THEN '1930s'
		   WHEN year >= 1940 AND year <= 1949 THEN '1940s'
		   WHEN year >= 1950 AND year <= 1959 THEN '1950s'
		   WHEN year >= 1960 AND year <= 1969 THEN '1960s'
		   WHEN year >= 1970 AND year <= 1979 THEN '1970s'
		   WHEN year >= 1980 AND year <= 1989 THEN '1980s'
		   WHEN year >= 1990 AND year <= 1999 THEN '1990s' 
		   WHEN year >= 2000 AND year <= 2010 THEN '2000s' END AS decade, 
ROUND((MAX(s.so_count)/MAX(g.game_count)), 2) AS avg_so	   
FROM games_by_count AS g 
INNER JOIN so_by_count AS s
ON g.year = s.yearid
WHERE year >= 1920 
	AND year < 2011
GROUP BY decade
ORDER BY decade ASC;





-- AVERAGE HOMERUNS PER A GAME BY DECADE

WITH games_by_count AS (SELECT year, sum(games) as game_count
						FROM homegames
			            GROUP BY year
					    ORDER BY year ASC),
	hr_by_count AS (SELECT yearid, sum(hr::numeric) AS hr_count
					FROM teams
					GROUP BY yearid
					ORDER BY yearid ASC)
SELECT 
	  CASE WHEN year >= 1920 AND year <= 1929 THEN '1920s'
		   WHEN year >= 1930 AND year <= 1939 THEN '1930s'
		   WHEN year >= 1940 AND year <= 1949 THEN '1940s'
		   WHEN year >= 1950 AND year <= 1959 THEN '1950s'
		   WHEN year >= 1960 AND year <= 1969 THEN '1960s'
		   WHEN year >= 1970 AND year <= 1979 THEN '1970s'
		   WHEN year >= 1980 AND year <= 1989 THEN '1980s'
		   WHEN year >= 1990 AND year <= 1999 THEN '1990s' 
		   WHEN year >= 2000 AND year <= 2010 THEN '2000s' END AS decade, 
ROUND((MAX(h.hr_count)/MAX(g.game_count)), 2) AS avg_hr   
FROM games_by_count AS g 
INNER JOIN hr_by_count AS h
ON g.year = h.yearid
WHERE year >= 1920 
	AND year < 2011
GROUP BY decade
ORDER BY decade ASC;