Assume you're given a table with measurement values obtained from a Google sensor over multiple days with measurements taken multiple times within each day.

Write a query to calculate the sum of odd-numbered and even-numbered measurements separately for a particular day and display the results in two different columns.
  Refer to the Example Output below for the desired format.

Definition:

Within a day, measurements taken at 1st, 3rd, and 5th times are considered odd-numbered measurements,
and measurements taken at 2nd, 4th, and 6th times are considered even-numbered measurements.


question=https://datalemur.com/questions/odd-even-measurements

code=
  WITH numbered_measurements AS (
    SELECT 
        CAST(measurement_time AS DATE) AS measurement_day,
        measurement_value,
        ROW_NUMBER() OVER (PARTITION BY CAST(measurement_time AS DATE) ORDER BY measurement_time) AS row_num
    FROM 
        measurements
)
SELECT 
    measurement_day,
    SUM(CASE WHEN row_num % 2 = 1 THEN measurement_value ELSE 0 END) AS odd_sum,
    SUM(CASE WHEN row_num % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM 
    numbered_measurements
GROUP BY 
    measurement_day;
