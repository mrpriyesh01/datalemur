Write a query to find how many UHG policy holders made three, or more calls, assuming each call is identified by the case_id column.

you can chaked this question on Datalemur website
question=https://datalemur.com/questions/frequent-callers

Code=
with cte  as(
Select policy_holder_id,
count(case_id) as call_count
from callers
group by policy_holder_id
having count(case_id)>=3
)
select count(policy_holder_id) as policy_holder_count
from cte;
