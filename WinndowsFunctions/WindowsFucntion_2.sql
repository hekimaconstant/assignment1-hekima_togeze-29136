SELECT 
    o.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    ROW_NUMBER() OVER (
        PARTITION BY o.customer_id 
        ORDER BY o.order_date, o.order_id
    ) AS order_sequence
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.customer_id, order_sequence;