-- refund_status
SELECT
    refund_status,
    COUNT(return_id) AS total_returns,
    ROUND(
        COUNT(return_id) * 100.0 /
        SUM(COUNT(return_id)) OVER (), 2)
        AS pct_of_total
FROM returns
GROUP BY refund_status
ORDER BY total_returns DESC;