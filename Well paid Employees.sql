Companies often perform salary analyses to ensure fair compensation practices. One useful analysis is to check if there are any employees earning more than their direct managers.

As a HR Analyst, you're asked to identify all employees who earn more than their direct managers. The result should include the employee's ID and name.

question=https://datalemur.com/questions/sql-well-paid-employees


code=SELECT
  e1.employee_id,
  e1.name AS employee_name
FROM
  employee e1
LEFT JOIN
  employee e2
ON e1.manager_id = e2.employee_id
WHERE
  e1.salary > e2.salary
