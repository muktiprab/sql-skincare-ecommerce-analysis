-- TOP 10 Prodcut
SELECT TOP 10
	p.product_id,
	p.product_name,
	p.category,
	oi.unit_price,
	SUM(oi.quantity) AS total_qty_sold,
	SUM(oi.item_total) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY
	p.product_id,
	p.product_name,
	p.category,
	unit_price
ORDER BY total_qty_sold DESC;