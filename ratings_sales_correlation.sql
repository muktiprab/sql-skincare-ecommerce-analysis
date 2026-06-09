-- Correlation Between Ratings and Sales Volume
SELECT
	p.product_id,
	p.product_name,
	p.category,
	AVG(CAST(r.rating AS DECIMAL(4,2))) AS avg_rating,
	SUM(oi.quantity) AS total_qty_sold,
	SUM(oi.item_total) AS total_items,
	COUNT(r.review_id) AS total_reviews
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN reviews r ON p.product_id = r.product_id
GROUP BY
	p.product_id,
	p.product_name,
	p.category
ORDER BY avg_rating DESC, total_qty_sold DESC;