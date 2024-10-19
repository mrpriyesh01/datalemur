Write a query to identify the manufacturers associated with the drugs that resulted in losses for CVS Health and calculate the total amount of losses incurred.

Output the manufacturer's name, the number of drugs associated with losses, and the total losses in absolute value. Display the results sorted in descending order
 with the highest losses displayed at the top.

 question=https://datalemur.com/questions/non-profitable-drugs


pharmacy_sales Example Input:
product_id	       units_sold	     total_sales	  cogs	        manufacturer	drug
156	                89514	          3130097.00	  3427421.73	   Biogen	    Acyclovir
25	                222331	        2753546.00	  2974975.36	   AbbVie	    Lamivudine and Zidovudine
50	                90484         	2521023.73	  2742445.90	   Eli Lilly	Dermasorb TA Complete Kit
98	                110746	        813188.82	    140422.87	      Biogen	  Medi-Chord

  Example Output:
manufacturer	  drug_count	total_loss
Biogen	         1	         297324.73
AbbVie	         1	        221429.36
Eli Lilly	       1	        221422.17

code

with pha as (
select manufacturer,
count(drug) as drug_count,
sum(cogs-total_sales) total_loss
from pharmacy_sales
WHERE cogs > total_sales
GROUP BY manufacturer
)
SELECT 
  manufacturer,
  drug_count,
  total_loss
FROM pha 
ORDER BY total_loss DESC;
