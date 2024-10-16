You're tasked with identifying these high earners across all departments. Write a query to display the employee's name along with their department name and salary.
 In case of duplicates, sort the results of department name in ascending order, then by salary in descending order. If multiple employees have the same salary, 
then order them alphabetically. 

  question=https://datalemur.com/questions/sql-top-three-salaries

CODE=
WITH RankedSalaries AS (
    SELECT 
        d.department_name,
        e.name,
        e.salary,
        DENSE_RANK() OVER (PARTITION BY e.department_id ORDER BY e.salary DESC) AS RNK 
    FROM 
        employee e 
    JOIN 
        department d ON d.department_id = e.department_id
)
SELECT 
    department_name,
    name,
    salary
FROM 
    RankedSalaries
WHERE 
    RNK <= 3
ORDER BY 
    department_name ASC,
    salary DESC,
    name ASC;
