-- product with highest and lowest rating
SELECT
	p.product_id,
	p.product_name,
	p.category,
	COUNT(r.review_id) AS total_review,
	AVG(CAST(r.rating AS DECIMAL(4,2))) AS avg_rating,
	MIN(r.rating) AS min_rating,
	MAX(r.rating) AS max_rating
FROM products p
JOIN reviews r ON p.product_id = r.product_id
GROUP BY
	p.product_id,
	p.product_name,
	p.category
ORDER BY avg_rating DESC;