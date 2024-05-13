#Customer With Increasing Purchase (Leat Code 2474)
-- Create the Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    price DECIMAL(10, 2)
);

-- Insert values into the Orders table
INSERT INTO Orders (order_id, customer_id, order_date, price) VALUES
(1, 1, '2019-07-01', 1100.00),
(2, 1, '2019-11-01', 1200.00),
(3, 1, '2020-05-26', 3000.00),
(4, 1, '2021-08-31', 3100.00),
(5, 1, '2022-12-07', 4700.00),
(6, 2, '2015-01-01', 700.00),
(7, 2, '2017-11-07', 1000.00),
(8, 3, '2017-01-01', 900.00),
(9, 3, '2018-11-07', 900.00);
INSERT INTO Orders (order_id, customer_id, order_date, price) VALUES
(10, 4, '2019-010-01', 1100.00);

WITH CTE AS(SELECT customer_id, date_format(order_date,'%Y') AS 'order_year' , SUM(price) AS 'price'
FROM Orders
GROUP BY order_year, customer_id
ORDER BY customer_id, order_year)
SELECT c1.customer_id
FROM CTE c1
LEFT JOIN CTE c2
ON c1.customer_id = c2.customer_id 
AND c1.order_year +1 = c2.order_year
AND c2.price > c1.price
GROUP BY 1
HAVING COUNT(*) - COUNT(c2.customer_id) = 1;
