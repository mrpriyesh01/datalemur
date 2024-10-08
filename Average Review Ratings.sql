Given the reviews table, write a query to retrieve the average star rating for each product, grouped by month. 
 The output should display the month as a numerical value, product ID, and average star rating rounded to two decimal places. Sort the output first by month and then by product ID.

reviews Example Input:

#note this is  an example table okk
review_id	   user_id	   submit_date	          product_id	  stars
6171	        123       	06/08/2022 00:00:00  	50001	        4
7802	        265	        06/10/2022 00:00:00	  69852	        4
5293	        362	        06/18/2022 00:00:00	  50001	        3
6352        	192	        07/26/2022 00:00:00	  69852        	3
4517	        981	        07/05/2022 00:00:00	  69852	        2
Example Output:
mth	   product	avg_stars
6	     50001	   3.50
6      69852	   4.00
7     69852	     2.50


code=
select  extract(month from submit_date) as mnt,
product_id as product,
round(avg("stars"),2) as avg_stars
from reviews
group by extract(month from submit_date),product
ORDER by mnt,product;

