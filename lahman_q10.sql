--Question 10
--Report the players' first and last names, and number of home runs they hit in 2016.

SELECT nameFirst, nameLast, (LEFT(debut,4)::numeric) as first_game, (LEFT(finalGame,4)::numeric)as last_game, 
HR as home_runs
FROM people as players
INNER JOIN batting
USING (playerID)
WHERE HR >=1
AND yearID =2016
ORDER BY HR DESC;





