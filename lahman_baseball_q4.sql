--Question 4 
SELECT SUM(po) AS total_putouts,
		CASE WHEN pos = 'OF' THEN 'Outfield' 
		 	 WHEN pos IN('SS','1B','2B','3B') THEN 'Infield'
		     WHEN pos IN('P','C') THEN 'Battery'
	         END AS field_position	
FROM fielding
WHERE yearid = '2016'
GROUP BY field_position;	   
			
--Battery made 41424 putouts, infield made 58934 putouts, outfield made 29560 putouts.