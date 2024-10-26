Zomato is a leading online food delivery service that connects users with various restaurants and cuisines, allowing them to browse menus, 
place orders, and get meals delivered to their doorsteps.

Recently, Zomato encountered an issue with their delivery system. Due to an error in the delivery driver instructions,
each item's order was swapped with the item in the subsequent row. As a data analyst, you're asked to correct this swapping error and return the proper pairing of order ID and item.

If the last item has an odd order ID, it should remain as the last item in the corrected data. For example, 
if the last item is Order ID 7 Tandoori Chicken, then it should remain as Order ID 7 in the corrected data.
In the results, return the correct pairs of order IDs and items.


question= https://datalemur.com/questions/sql-swapped-food-delivery






WITH CTE AS (
    SELECT  order_id,item,
        ROW_NUMBER() OVER (ORDER BY order_id) AS row_num
    FROM orders
)
SELECT 
    order_id AS corrected_order_id,
    CASE 
        WHEN order_id = (SELECT MAX(order_id) FROM orders) AND order_id % 2 != 0 THEN item
        WHEN row_num % 2 = 0 THEN 
            (SELECT item FROM CTE WHERE row_num = o.row_num - 1)
        ELSE 
            (SELECT item FROM CTE WHERE row_num = o.row_num + 1)
    END AS item
FROM 
    CTE o
ORDER BY 
    order_id;
