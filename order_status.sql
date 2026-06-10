SELECT
	order_status,
	COUNT(order_id) AS total_order_status
FROM orders
GROUP BY order_status
ORDER BY total_order_status DESC;