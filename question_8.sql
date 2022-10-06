--HIGHEST AVERAGE ATTENDANCE IN YEAR 2016

SELECT t.name, p.park_name, (SUM(h.attendance)/SUM(h.games)) AS avg_attendance
FROM homegames AS h
INNER JOIN teams AS t
ON h.team = t.teamid
  AND h.year = t.yearid
INNER JOIN parks AS p
ON h.park = p.park
WHERE h.year = '2016'
GROUP BY t.name, p.park_name
HAVING SUM(h.games) >= 10
ORDER BY avg_attendance DESC
LIMIT 5 ;

-- LOWEST AVERAGE ATTENDANCE IN 2016

SELECT t.name, p.park_name, (SUM(h.attendance)/SUM(h.games)) AS avg_attendance
FROM homegames AS h
INNER JOIN teams AS t
ON h.team = t.teamid
  AND h.year = t.yearid
INNER JOIN parks AS p
ON h.park = p.park
WHERE h.year = '2016'
GROUP BY t.name, p.park_name
HAVING SUM(h.games) >= 10
ORDER BY avg_attendance ASC
LIMIT 5 ;