Assume you have an events table on Facebook app analytics. 
Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.

Definition and note:
Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
To avoid integer division, multiply the CTR by 100.0, not 100.

events Example Input:
app_id	   event_type	    timestamp
123	       impression   	07/18/2022 11:36:12
123	       impression	    07/18/2022 11:37:12
123	       click	        07/18/2022 11:37:42
234	       impression	    07/18/2022 14:15:12
234	       click	        07/18/2022 14:16:12
Example Output:
app_id	ctr
123	    50.00
234	   100.00

this is only example table and output note it 

code=
SELECT 
  app_id,
 ROUND(100.0 *
    sum(case WHEN event_type = 'click' then 1 ELSE 0 END) / 
    sum(case WHEN event_type = 'impression' then 1 ELSE 0 END),2) as ctr
FROM events
WHERE timestamp BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY app_id;


