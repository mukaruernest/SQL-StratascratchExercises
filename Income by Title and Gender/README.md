# Exercise: Income By Title and Gender 

## Table of Contents

- [DataSets](https://github.com/mukaruernest/StratascratchExercises/tree/master/Bikes%20Last%20Used#dataset)
- [Questions](https://github.com/mukaruernest/StratascratchExercises/tree/master/Bikes%20Last%20Used#question)
- [Solutions](https://github.com/mukaruernest/StratascratchExercises/tree/master/Bikes%20Last%20Used#solution)
- [Approach]()


More details about this exercise can be found on [Stratascratch website](https://platform.stratascratch.com/coding-question?id=10077&python=)

## DataSets

`sf_employee`
`sf_bonus`

**Table 1: sf_employee**

This partial display of the table see the full table [here](https://platform.stratascratch.com/coding-question/output-preview)

<html><body>
<!--StartFragment-->

id | first_name | last_name | age | sex | employee_title | department | salary | target | email | city | address | manager_id
-- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | --
5 | Max | George | 26 | M | Sales | Sales | 1300 | 200 | Max@company.com | California | 2638 Richards Avenue | 1
13 | Katty | Bond | 56 | F | Manager | Management | 150000 | 0 | Katty@company.com | Arizona |   | 1
11 | Richerd | Gear | 57 | M | Manager | Management | 250000 | 0 | Richerd@company.com | Alabama |   | 1
10 | Jennifer | Dion | 34 | F | Sales | Sales | 1000 | 200 | Jennifer@company.com | Alabama |   | 13
19 | George | Joe | 50 | M | Manager | Management | 100000 | 0 | George@company.com | Florida | 1003 Wyatt Street | 1
18 | Laila | Mark | 26 | F | Sales | Sales | 1000 | 200 | Laila@company.com | Florida | 3655 Spirit Drive | 11
20 | Sarrah | Bicky | 31 | F | Senior Sales | Sales | 2000 | 200 | Sarrah@company.com | Florida | 1176 Tyler Avenue | 19
21 | Suzan | Lee | 34 | F | Sales | Sales | 1300 | 200 | Suzan@company.com | Florida | 1275 Monroe Avenue | 19
22 | Mandy | John | 31 | F | Sales | Sales | 1300 | 200 | Mandy@company.com | Florida | 2510 Maryland Avenue | 19

<!--EndFragment-->
</body>
</html>

**Table 1: sf_bonus**

<html><body>
<!--StartFragment-->

worker_ref_id | bonus | bonus_date
-- | -- | --
1 | 5000 | 2020-02-16
2 | 3000 | 2011-06-16
3 | 4000 | 2020-02-16
1 | 4500 | 2020-02-16
2 | 3500 | 2011-06-16

<!--EndFragment-->
</body>
</html>

## Question 

Find the average total compensation based on employee titles and gender. Total compensation is calculated by adding both the salary and bonus of each employee. However, not every employee receives a bonus so disregard employees without bonuses in your calculation. 

Output the employee title, gender (i.e., sex), along with the average total compensation.

## Solution

``` SQL
WITH
    sf_bonus
    AS
    (
        SELECT worker_ref_id, SUM(bonus) AS bonuses, bonus_date
        FROM sf_bonus
        GROUP BY worker_ref_id, bonus_date
    )
SELECT e.employee_title, e.sex, AVG(e.salary + b.bonuses) AS Averagetotalcompensation
FROM sf_bonus b
    INNER JOIN sf_employee e ON b.worker_ref_id = e.id
GROUP BY e.employee_title, e.sex
```

**Result**

<html><body>
<!--StartFragment-->

employee_title | sex | averagetotalcompensation
-- | -- | --
Senior Sales | M | 6000
Manager | F | 209500
Sales | M | 7500

<!--EndFragment-->
</body>
</html>

## Approach

Take a look at the data structure. Worker_ref_id in table `sf_bonus` is not primary key. This is important information when joining two tables.

Created a CTE to group `Worker_ref_id`s together
