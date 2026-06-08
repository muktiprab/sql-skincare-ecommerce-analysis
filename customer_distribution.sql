-- Customers Distribution by Gender
SELECT gender,
	COUNT(customer_id) AS total_customers
FROM customers
GROUP BY gender
ORDER BY total_customers DESC;

-- Customers Distribution by Age Group
SELECT age_group,
	COUNT(customer_id) AS total_customers
FROM customers
GROUP BY age_group
ORDER BY total_customers DESC;

-- Customers Distribution by Area
SELECT state,
	COUNT(customer_id) AS total_customers
FROM customers
GROUP BY state
ORDER BY total_customers DESC;