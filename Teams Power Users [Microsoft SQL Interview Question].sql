Write a query to identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams in August 2022.
Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending order based on the count of the messages.

messages Example Input:
message_id	         sender_id	receiver_id	     content	               sent_date
901                 	3601	    4500	           You up?	                08/03/2022 00:00:00
902	                  4500	    3601            	 Only if  buying	      08/03/2022 00:00:00
743	                 3601	      8752	             Let's  this offline	  06/14/2022 00:00:00
922	                 3601	      4500	            Get on the call	        08/10/2022 00:00:00
Example Output:
sender_id	 message_count
3601	       2
4500	       1

  code=
SELECT  sender_id,count(sender_id) as message_count
from messages
WHERE EXTRACT(MONTH FROM sent_date) = '8'
AND EXTRACT(YEAR FROM sent_date) = '2022'
group by sender_id
order by message_count desc
limit 2;
