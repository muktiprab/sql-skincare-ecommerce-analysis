SELECT 
c.acquisition_channel,
	COUNT(DISTINCT c.customer_id) AS total_customers,
	COUNT(DISTINCT o.order_id) AS total_orders,
	SUM(o.final_amount) AS total_revenue,
	AVG(o.final_amount) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.acquisition_channel
ORDER BY total_revenue DESC;