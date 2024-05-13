SELECT a.player_id, a.device_id 
FROM activity a
WHERE (a.player_id, a.event_date) IN (
    SELECT b.player_id, MIN(b.event_date) 
    FROM activity b 
    GROUP BY b.player_id
);

# 2nd solution With CTE
WITH CTE AS(
SELECT player_id, device_id,event_date, RANK() OVER(PARTITION BY player_id ORDER BY event_date) AS 'rank'
FROM activity
)
SELECT c.player_id, c.device_id FROM CTE c WHERE c.rank =1;
