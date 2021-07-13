# Exercise: Highest Energy Consumption 

## Table of Contents

- [DataSets](https://github.com/mukaruernest/StratascratchExercises/tree/master/Highest%20Energy%20Consumption#datasets)
- [Questions](https://github.com/mukaruernest/StratascratchExercises/tree/master/Highest%20Energy%20Consumption#question)
- [Solutions](https://github.com/mukaruernest/StratascratchExercises/tree/master/Highest%20Energy%20Consumption#solution)
- [Approach](https://github.com/mukaruernest/StratascratchExercises/tree/master/Highest%20Energy%20Consumption#approach)


More details about this exercise can be found on [Stratascratch website](https://platform.stratascratch.com/coding-question?python=&id=10064)

## DataSets

`fb_eu_energy`
`fb_asia_energy`
`fb_na_energy`

**Table 1: fb_eu_energy**
<html><body>
<!--StartFragment-->

date | consumption
-- | --
2020-01-01 | 400
2020-01-02 | 350
2020-01-03 | 500
2020-01-04 | 500
2020-01-07 | 600

<!--EndFragment-->
</body>
</html>

**Table 2: fb_asia_energy**

<html><body>
<!--StartFragment-->

date | consumption
-- | --
2020-01-01 | 400
2020-01-02 | 400
2020-01-04 | 675
2020-01-05 | 1200
2020-01-06 | 750
2020-01-07 | 400

<!--EndFragment-->
</body>
</html>

**Table 3: fb_na_energy**

<html><body>
<!--StartFragment-->

date | consumption
-- | --
2020-01-01 | 250
2020-01-02 | 375
2020-01-03 | 600
2020-01-06 | 500
2020-01-07 | 250

<!--EndFragment-->
</body>
</html>

## Question 

Find the date with the highest total energy consumption from the Facebook data centers. Output the date along with the total energy consumption across all data centers.

## Solution

``` SQL
WITH
    combinedtable
    AS
    (
            SELECT *
            FROM fb_eu_energy
        UNION ALL
            SELECT *
            FROM fb_asia_energy
        UNION ALL
            SELECT *
            FROM fb_na_energy
    ),
    totalenergy
    AS
    (
        SELECT date, SUM(consumption) AS  totalconsumption
        FROM combinedtable
        GROUP BY date
    ),
    maxconsumption
    AS
    (
        SELECT MAX(totalconsumption) AS Maxconsumption
        FROM totalenergy
    )
SELECT totalenergy.date, maxconsumption.Maxconsumption
FROM totalenergy
    INNER JOIN maxconsumption ON totalenergy.totalconsumption = maxconsumption.Maxconsumption

```

**Result**
<html><body>
<!--StartFragment-->

date | maxconsumption
-- | --
2020-01-06 | 1250
2020-01-07 | 1250

<!--EndFragment-->
</body>
</html>

## Approach

- Used UNION ALLs to combine all data in a list so that I don't lose any data

- Used the SUM() function to find the total energy consumption by date

- Found the max total energy consumption independent of date

- Using the max total energy and the sum of energy by date, joined the two tables to get the date of the max total energy
