SELECT *
FROM people ;

SELECT playerid, namefirst, namelast, min(height) AS height
FROM people
GROUP BY playerid, namefirst, namelast
ORDER BY height asc
LIMIT 1;




