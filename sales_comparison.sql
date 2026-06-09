-- 
SELECT
	sales_channel,
	COUNT(order_id) AS total_orders,
	SUM(final_amount) AS total_revenue,
	AVG(final_amount) AS avg_revenue,
	SUM(discount_amount) AS total_discount_given,
	AVG(discount_amount) AS avg_discount
FROM orders
GROUP BY sales_channel
ORDER BY total_orders DESC;