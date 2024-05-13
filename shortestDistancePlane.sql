-- Create the Point2D table
CREATE TABLE Point2D (
    x INT,
    y INT
);

-- Insert data into the point_2d table
INSERT INTO Point2D (x, y) VALUES
(-1, -1),
(0, 0),
(-1, -2);

#attempts to retrieve pairs of points from the point_2d 
#table where the x or y coordinates of the points are not equal.
SELECT p1.x AS 'x1', p2.x AS 'x2', p1.y AS'y1', p2.y AS'y2'
FROM Point2D  p1
JOIN Point2D  p2
ON p1.x != p2.x OR p1.y!= p2.y;

# Query to find the shorest distance with repeated values
SELECT ROUND(SQRT(POW(p2.x-p1.x,2) + POW(p2.y-p1.y,2)),2)AS 'shortest' FROM Point2D p1
JOIN Point2D  p2
ON p1.x != p2.x OR p1.y!= p2.y
ORDER BY shortest
LIMIT 1;

# Query to find the shorest distance without repeated values
SELECT ROUND(SQRT(POW(p2.x-p1.x,2) + POW(p2.y-p1.y,2)),2)AS 'shortest' FROM Point2D p1
JOIN Point2D  p2
ON (p1.x >= p2.x AND p1.y < p2.y) 
OR 
(p1.x >= p2.x AND p1.y > p2.y) 
OR
(p1.x< p2.x AND p1.y = p2.y)
ORDER BY shortest
LIMIT 1 ;
