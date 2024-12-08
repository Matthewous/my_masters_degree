SELECT 
    u.email AS user_login,
    SUM(ft.monthly_price * s.duration_months) AS total_payment
FROM 
    Subscriptions s
JOIN 
    Users u ON s.user_id = u.id
JOIN 
    ForecastTypes ft ON s.forecast_type_id = ft.id
WHERE 
    s.start_date >= DATE_TRUNC('year', CURRENT_DATE)
GROUP BY 
    u.email;
