--Question 1
SELECT DISTINCT MIN(yearid) AS first_game,
				MAX(yearid) AS last_game
FROM teams;
