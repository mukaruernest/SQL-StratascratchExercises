# StrataScratch Exercises

## Exercise: Highest Cost Orders

## Table of Contents

[DataSets]()
[Questions]()
[Solutions]()

More details about this exercise can be found on [Stratascratch website](https://platform.stratascratch.com/coding-question?id=9915&python=)

## DataSet

`customers`
`orders`



**Table 1: customers**
<html><body>
<!--StartFragment-->

id | first_name | last_name | city | address | phone_number
-- | -- | -- | -- | -- | --
8 | John | Joseph | San Francisco |   | 928-386-8164
7 | Jill | Michael | Austin |   | 813-297-0692
4 | William | Daniel | Denver |   | 813-368-1200
5 | Henry | Jackson | Miami |   | 808-601-7513
13 | Emma | Isaac | Miami |   | 808-690-5201
14 | Liam | Samuel | Miami |   | 808-555-5201
15 | Mia | Owen | Miami |   | 808-640-5201
1 | Mark | Thomas | Arizona | 4476 Parkway Drive | 602-993-5916
12 | Eva | Lucas | Arizona | 4379 Skips Lane | 301-509-8805
6 | Jack | Aiden | Arizona | 4833 Coplin Avenue | 480-303-1527
2 | Mona | Adrian | Los Angeles | 1958 Peck Court | 714-409-9432
10 | Lili | Oliver | Los Angeles | 3832 Euclid Avenue | 530-695-1180
3 | Farida | Joseph | San Francisco | 3153 Rhapsody Street | 813-368-1200
9 | Justin | Alexander | Denver | 4470 McKinley Avenue | 970-433-7589
11 | Frank | Jacob | Miami | 1299 Randall Drive | 808-590-5201

<!--EndFragment-->
</body>
</html>

**Table 2: orders**

<html><body>
<!--StartFragment-->

id | cust_id | order_date | order_quantity | order_details | order_cost
-- | -- | -- | -- | -- | --
1 | 3 | 2019-03-04 | 4 | Coat | 100
2 | 3 | 2019-03-01 | 1 | Shoes | 80
3 | 3 | 2019-03-04 | 1 | Skirt | 30
4 | 7 | 2019-02-01 | 1 | Coat | 25
5 | 7 | 2019-03-10 | 1 | Shoes | 80
6 | 15 | 2019-02-01 | 2 | Boats | 100
7 | 15 | 2019-01-11 | 3 | Shirts | 60
8 | 15 | 2019-03-11 | 1 | Slipper | 20
9 | 15 | 2019-03-01 | 2 | Jeans | 80
10 | 15 | 2019-03-09 | 3 | Shirts | 50
11 | 5 | 2019-02-01 | 1 | Shoes | 80
12 | 12 | 2019-01-11 | 3 | Shirts | 60
13 | 12 | 2019-03-11 | 1 | Slipper | 20
14 | 4 | 2019-02-01 | 1 | Shoes | 80
15 | 4 | 2019-01-11 | 3 | Shirts | 60
16 | 3 | 2019-04-19 | 3 | Shirts | 50
17 | 7 | 2019-04-19 | 1 | Suit | 150
18 | 15 | 2019-04-19 | 1 | Skirt | 30
19 | 15 | 2019-04-19 | 2 | Dresses | 200
20 | 12 | 2019-01-11 | 5 | Coat | 125
21 | 7 | 2019-04-01 | 1 | Suit | 50
22 | 7 | 2019-04-02 | 1 | Skirt | 30
23 | 7 | 2019-04-03 | 1 | Dresses | 50
24 | 7 | 2019-04-04 | 1 | Coat | 25

<!--EndFragment-->
</body>
</html>

## Question 

Find the customer with the highest total order cost within a single day between 2019-02-01 to 2019-05-01. Total order cost is calculated as order_cost*order_quantity. Output their first name, total cost of their items, and the date.

For simplicity, you can assume that every first name in the dataset is unique. Also, the cost of the certain item (e.g. coat) could vary among different purchases (not all coats cost the same).

## Solution

``` SQL
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
```

**Result** 
<html><body>
<!--StartFragment-->

Farida | 2019-03-04 | 430
-- | -- | --
Mia | 2019-04-19 | 430

<!--EndFragment-->
</body>
</html>
