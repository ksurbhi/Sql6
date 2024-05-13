# Game Play Analysis III
CREATE TABLE activity2 (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT,
    PRIMARY KEY (player_id, event_date)
);

INSERT INTO activity2 (player_id, device_id, event_date, games_played) VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-05-02', 6),
(1, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);

SELECT player_id, event_date, SUM(games_played) 
OVER(PARTITION BY player_id ORDER BY event_date)
AS'games_played_so_far' 
FROM activity2;
