-- Top Payment Method
SELECT
	payment_method,
	COUNT(order_id) AS total_order
FROM orders
GROUP BY payment_method
ORDER BY total_order DESC;