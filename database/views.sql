CREATE VIEW member_summary AS
SELECT
    m.member_id,
    m.first_name,
    m.last_name,
    m.email,
    mt.tier_name,
    mt.points_multiplier,
    m.points_balance,
    m.annual_spend,
    COUNT(t.transaction_id) AS transaction_count,
    COALESCE(SUM(t.purchase_amount), 0) AS total_purchases
FROM members m
INNER JOIN member_tiers mt
    ON m.tier_id = mt.tier_id
LEFT JOIN transactions t
    ON m.member_id = t.member_id
GROUP BY
    m.member_id,
    m.first_name,
    m.last_name,
    m.email,
    mt.tier_name,
    mt.points_multiplier,
    m.points_balance,
    m.annual_spend;