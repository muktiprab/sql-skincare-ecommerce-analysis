-- loyal customer by order frequency
SELECT TOP 10
	c.customer_id,
	c.customer_name,
	c.city,
	c.state,
	c.age_group,
	COUNT(o.order_id) AS total_orders,
	SUM(o.final_amount) AS total_spent,
	AVG(o.final_amount) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY
	c.customer_id,
	c.customer_name,
	c.city,
	c.state,
	c.age_group
ORDER BY total_orders DESC, total_spent DESC;