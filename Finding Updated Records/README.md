# Exercise: Finding Updated Records

## Table of Contents

- [DataSets](https://github.com/mukaruernest/StratascratchExercises/tree/master/Highest%20Cost%20Orders#dataset)
- [Questions](https://github.com/mukaruernest/StratascratchExercises/tree/master/Highest%20Cost%20Orders#question)
- [Solutions](https://github.com/mukaruernest/StratascratchExercises/tree/master/Highest%20Cost%20Orders#solution)

More details about this exercise can be found on [Stratascratch website](https://platform.stratascratch.com/coding-question?id=10299&python=)

## DataSet

`ms_employee_salary`


**Table 1: ms_employee_salary**

This table contains the first ten row only. The whole table can be view [here](https://platform.stratascratch.com/coding-question/output-preview)

<html><body>
<!--StartFragment-->

id | first_name | last_name | salary | department_id
-- | -- | -- | -- | --
1 | Todd | Wilson | 110000 | 1006
1 | Todd | Wilson | 106119 | 1006
2 | Justin | Simon | 128922 | 1005
2 | Justin | Simon | 130000 | 1005
3 | Kelly | Rosario | 42689 | 1002
4 | Patricia | Powell | 162825 | 1004
4 | Patricia | Powell | 170000 | 1004
5 | Sherry | Golden | 44101 | 1002
6 | Natasha | Swanson | 79632 | 1005
6 | Natasha | Swanson | 90000 | 1005
7 | Diane | Gordon | 74591 | 1002
8 | Mercedes | Rodriguez | 61048 | 1005
9 | Christy | Mitchell | 137236 | 1001
9 | Christy | Mitchell | 140000 | 1001
9 | Christy | Mitchell | 150000 | 1001
10 | Sean | Crawford | 182065 | 1006
10 | Sean | Crawford | 190000 | 1006
11 | Kevin | Townsend | 166861 | 1002
12 | Joshua | Johnson | 123082 | 1004

<!--EndFragment-->
</body>
</html>

## Question 

We have a table with employees and their salaries, however, some of the records are old and contain outdated salary information. Find the current salary of each employee assuming that salaries increase each year. Output their id, first name, last name, department ID, and current salary. Order your list by employee ID in ascending order.

## Solution

``` SQL
SELECT id, first_name, last_name, department_id, MAX(salary) AS Salary
FROM ms_employee_salary
GROUP BY id, first_name, last_name, department_id
ORDER BY id ASC
```

**Result** 

This table contains the first ten row only. The whole table can be view [here](https://platform.stratascratch.com/coding-question/output-preview)

<html><body>
<!--StartFragment-->

id | first_name | last_name | department_id | salary
-- | -- | -- | -- | --
1 | Todd | Wilson | 1006 | 110000
2 | Justin | Simon | 1005 | 130000
3 | Kelly | Rosario | 1002 | 42689
4 | Patricia | Powell | 1004 | 170000
5 | Sherry | Golden | 1002 | 44101
6 | Natasha | Swanson | 1005 | 90000
7 | Diane | Gordon | 1002 | 74591
8 | Mercedes | Rodriguez | 1005 | 61048
9 | Christy | Mitchell | 1001 | 150000
10 | Sean | Crawford | 1006 | 190000

<!--EndFragment-->
</body>
</html>
