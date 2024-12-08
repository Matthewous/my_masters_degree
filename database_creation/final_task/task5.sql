SELECT 
    u1.email AS userlogin1,
    u2.email AS userlogin2
FROM 
    Subscriptions s1
JOIN 
    Subscriptions s2 
    ON s1.forecast_type_id = s2.forecast_type_id
    AND s1.user_id < s2.user_id
JOIN 
    Users u1 ON s1.user_id = u1.id
JOIN 
    Users u2 ON s2.user_id = u2.id
GROUP BY 
    u1.email, u2.email
HAVING 
    COUNT(DISTINCT s1.start_date) >= 2;
