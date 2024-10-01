Given a table of Facebook posts, for each user who posted at least twice in 2021,
write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021.
Output the user and number of the days between each user's first and last post.


posts Example Input:
user_id	        post_id	      post_content	          post_date
151652        	599415	      Need a hug	            07/10/2021 12:00:00
661093	        624356	      Bed. Class 8-12. 	      07/29/2021 13:00:00
004239	        784254	      Happy 4th of July!	    07/04/2021 11:00:00
661093	        442560	     Just going to cry      	07/08/2021 14:00:00
151652        	111766	      I'm so done with covid 	07/12/2021 19:00:00

Example Output:
user_id  	 days_between
151652	    2
661093	    21

code=
SELECT 
	user_id, 
    MAX(post_date::date)- MIN(post_date::date) AS days_between
FROM
	posts
WHERE
	DATE_PART('year',post_date::date)=2021 
GROUP BY 
	user_id
	having COUNT(post_id)>1

