WITH customer_orders AS (
    SELECT 
        c.customer_id, c.customer_name, o.order_id, o.order_date,
        LAG(o.order_date) OVER (
            PARTITION BY o.customer_id 
            ORDER BY o.order_date
        ) AS previous_order_date
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
)
SELECT 
    customer_id, customer_name, order_id, order_date, previous_order_date,
    (order_date - previous_order_date) AS days_between_orders
FROM customer_orders
WHERE previous_order_date IS NOT NULL
ORDER BY customer_id, order_date;