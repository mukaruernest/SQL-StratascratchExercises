# StrataScratch Exercises

## Question 1: Salaries Differences

More details about this exercise can be found on [Stratascratch website](https://platform.stratascratch.com/coding-question?id=10308&python=)

**DataSet**

_DataSet shows the first ten rows of the table, to view the full table follow [this link](https://platform.stratascratch.com/coding-question/output-preview)_  

**Table Name: db_employee**

<html><body>
<!--StartFragment-->

id | first_name | last_name | salary | department_id
-- | -- | -- | -- | --
10301 | Keith | Morgan | 27056 | 2
10302 | Tyler | Booth | 32199 | 3
10303 | Clifford | Nguyen | 32165 | 2
10304 | Mary | Jones | 49488 | 3
10305 | Melissa | Lucero | 27024 | 3
10306 | Ashley | Li | 28516 | 4
10307 | Joseph | Solomon | 19945 | 1
10308 | Anthony | Sanchez | 43801 | 3
10309 | Katherine | Huffman | 12984 | 4
10310 | Dawn | Foley | 28902 | 2
10311 | Melissa | Holmes | 33575 | 1

<!--EndFragment-->
</body>
</html>

**Table Name: db_dept**

<html><body>
<!--StartFragment-->

id | department
-- | --
1 | engineering
2 | human resource
3 | operation
4 | marketing
5 | sales
6 | customer care

<!--EndFragment-->
</body>
</html>

### Question 

Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. Output just the difference in salaries.

### Solution

``` SQL
SELECT
  (SELECT max(salary)
  FROM db_employee emp
    JOIN db_dept dept ON emp.department_id = dept.id
  WHERE department = 'marketing') -
  (SELECT max(salary)
  FROM db_employee emp
    JOIN db_dept dept ON emp.department_id = dept.id
  WHERE department = 'engineering') AS salary_difference;
```

**Result** 
<html><body>
<!--StartFragment-->

salary_difference
--
2400

<!--EndFragment-->
</body>
</html>
