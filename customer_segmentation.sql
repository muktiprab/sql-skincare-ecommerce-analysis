SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    c.state,
    c.age_group,
    c.acquisition_channel,
    SUM(o.final_amount)  AS total_spent,
    COUNT(o.order_id)    AS total_orders,
    CASE
        WHEN SUM(o.final_amount) >= 5000 THEN 'High Value'
        WHEN SUM(o.final_amount) >= 2000 THEN 'Mid Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city,
    c.state,
    c.age_group,
    c.acquisition_channel
ORDER BY total_spent DESC;