Write a query to retrieve the mode of the order occurrences. Additionally, if there are multiple item counts with the same mode, 
  the results should be sorted in ascending order.

Clarifications:

item_count: Represents the number of items sold in each order.
order_occurrences: Represents the frequency of orders with the corresponding number of items sold per order.
For example, if there are 800 orders with 3 items sold in each order, the record would have an item_count of 3 and an order_occurrences of 800.



code=

select item_count as mode
from items_per_order
where order_occurrences=(select max(order_occurrences)  from items_per_order)
order by item_count;

