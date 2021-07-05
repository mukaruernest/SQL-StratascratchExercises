# StrataScratch Exercises

## Exercise: Number Of Units Per Nationality

## Table of Contents
 - [DataSet](https://github.com/mukaruernest/StratascratchExercises/tree/master/Number%20Of%20Units%20Per%20Nationality#dataset)
 - [Question](https://github.com/mukaruernest/StratascratchExercises/tree/master/Number%20Of%20Units%20Per%20Nationality#question)
 - [Solution](https://github.com/mukaruernest/StratascratchExercises/tree/master/Number%20Of%20Units%20Per%20Nationality#solution)
 - [Result](https://github.com/mukaruernest/StratascratchExercises/tree/master/Number%20Of%20Units%20Per%20Nationality#result)
 
More details about this exercise can be found on [Stratascratch website](https://platform.stratascratch.com/coding-question?python=&id=10156)

## DataSet

`airbnb_hosts`
`airbnb_units`



**Table 1: airbnb_hosts**

<html><body>
<!--StartFragment-->

host_id | nationality | gender | age
-- | -- | -- | --
0 | USA | M | 28
1 | USA | F | 29
2 | China | F | 31
3 | China | M | 24
4 | Mali | M | 30
5 | Mali | F | 30
6 | Luxembourg | M | 25
7 | Luxembourg | F | 25
8 | Australia | F | 33
9 | Australia | M | 35
10 | Brazil | M | 39
11 | Brazil | F | 42

<!--EndFragment-->
</body>
</html>

**Table 2: airbnb_units**

<html><body>
<!--StartFragment-->

host_id | unit_id | unit_type | n_beds | n_bedrooms | country | city
-- | -- | -- | -- | -- | -- | --
0 | A1 | Room | 1 | 1 | USA | New York
0 | A2 | Room | 1 | 1 | USA | New Jersey
0 | A3 | Room | 1 | 1 | USA | New Jersey
1 | A4 | Apartment | 2 | 1 | USA | Houston
1 | A5 | Apartment | 2 | 1 | USA | Las Vegas
2 | A6 | Yurt | 3 | 1 | Mongolia | -
3 | A7 | Penthouse | 3 | 3 | China | Tianjin
3 | A8 | Penthouse | 5 | 5 | China | Beijing
4 | A9 | Apartment | 2 | 1 | Mali | Bamako
5 | A10 | Room | 3 | 1 | Mali | Segou
5 | A11 | Room | 2 | 1 | Mali | Segou
6 | A12 | Penthouse | 6 | 6 | Luxembourg | Luxembourg

<!--EndFragment-->
</body>
</html>

## Question 

Find the number of apartments per nationality that are owned by people under 30 years old.

Output the nationality along with the number of apartments.

Sort records by the apartments count in descending order.

## Solution

``` SQL
SELECT hs.nationality, count(un.unit_id) AS NumberOfApartments
FROM airbnb_hosts hs
    INNER JOIN airbnb_units un ON hs.host_id = un.host_id
WHERE hs.age < 30 AND un.unit_type = 'Apartment'
GROUP BY nationality
ORDER BY NumberOfApartments DESC
```

## Result
<html><body>
<!--StartFragment-->

nationality | numberofapartments
-- | --
USA | 2

<!--EndFragment-->
</body>
</html>
