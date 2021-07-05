SELECT c.first_name, o.order_date, SUM(o.order_cost * o.order_quantity) AS TotalOrderCost
FROM Orders o
    INNER JOIN customers c ON o.cust_id = c.id
WHERE order_date BETWEEN '2019-02-01' AND '2019-05-01'
GROUP BY first_name, order_date
HAVING SUM(o.order_cost * o.order_quantity) = 
(SELECT SUM(order_cost * order_quantity) AS TotalOrderCost
FROM orders
WHERE order_date BETWEEN '2019-02-01' AND '2019-05-01'
GROUP BY cust_id, order_date
ORDER BY TotalOrderCost DESC
LIMIT 1)