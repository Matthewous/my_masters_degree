SELECT 
    s1.id AS conflicting_subscription_id1,
    s2.id AS conflicting_subscription_id2
FROM 
    Subscriptions s1
JOIN 
    Subscriptions s2 
    ON s1.user_id = s2.user_id
    AND s1.forecast_type_id = s2.forecast_type_id
    AND s1.start_date < s2.start_date
    AND s1.start_date + INTERVAL '1 month' * s1.duration_months > s2.start_date;
