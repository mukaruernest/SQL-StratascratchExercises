WITH
    combinedcolumns
    AS
    (
        SELECT business_postal_code, LOWER(SPLIT_PART(business_address, ' ', 1 )) street
        FROM sf_restaurant_health_violations
        WHERE business_address ~ '^[A-Za-z]' AND business_postal_code IS NOT NULL UNION ALL
        SELECT business_postal_code, LOWER(SPLIT_PART(business_address, ' ', 2)) street
        FROM sf_restaurant_health_violations
        WHERE business_address ~ '^[0-9]' AND business_postal_code IS NOT NULL
    )
SELECT business_postal_code, count(distinct street)
FROM combinedcolumns
GROUP BY business_postal_code
ORDER BY 2 DESC, 1 ASC