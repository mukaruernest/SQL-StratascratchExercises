SELECT id, first_name, last_name, department_id, MAX(salary) AS Salary
FROM ms_employee_salary
GROUP BY id, first_name, last_name, department_id
ORDER BY id ASC