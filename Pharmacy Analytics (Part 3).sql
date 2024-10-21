Write a query to calculate the total drug sales for each manufacturer. Round the answer to the nearest million and report your results in descending order of total sales.
In case of any duplicates, sort them alphabetically by the manufacturer name.


question=   https://datalemur.com/questions/total-drugs-sales


codo=
SELECT manufacturer,
concat('$',ROUND((SUM(total_sales)/1000000),0),' million') AS sale FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC;
