-- return_reason
SELECT
    refund_status,
    return_reason,
    COUNT(return_id) AS total_returns,
    ROUND(
        COUNT(return_id) * 100.0 /
        SUM(COUNT(return_id)) OVER (), 2)
        AS pct_of_total
FROM returns
GROUP BY refund_status, return_reason
ORDER BY total_returns DESC;