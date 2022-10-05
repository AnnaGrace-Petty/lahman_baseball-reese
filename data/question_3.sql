--Q3
/* Find all players in the database who played at Vanderbilt University. 
Create a list showing each player’s first and last names as well as the 
total salary they earned in the major leagues. Sort this list in descending 
order by the total salary earned. Which Vanderbilt player earned the most 
money in the majors?*/ 
--DAVID PRICE
WITH vandy_players AS (SELECT schoolid, schoolname, playerid
	                   FROM schools INNER JOIN collegeplaying
                       USING (schoolid)
                       WHERE schoolname ILIKE '%Vanderbilt%'),
salary_names AS (SELECT salary, namefirst, namelast, playerid
			          FROM people INNER JOIN salaries
                      USING (playerid) 
                      ORDER BY salary DESC)
SELECT namefirst, namelast, SUM (salary) AS total_salary, schoolname
FROM vandy_players INNER JOIN salary_names
USING (playerid)
GROUP BY namefirst, namelast, schoolname
ORDER BY total_salary DESC;
