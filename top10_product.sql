-- TOP 10 Prodcut
SELECT TOP 10
	p.product_id,
	p.product_name,
	p.category,
	SUM(oi.quantity) AS total_qty_sold,
	SUM(oi.item_total) AS total_revenue,
	AVG(oi.unit_price) AS avg_unit_price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY
	p.product_id,
	p.product_name,
	p.category
ORDER BY total_qty_sold DESC;