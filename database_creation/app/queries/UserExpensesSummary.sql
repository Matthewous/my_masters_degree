SELECT u.user_id,
       COALESCE(SUM(i.amount), 0) - COALESCE(SUM(e.amount), 0) AS balance
FROM users u
LEFT JOIN incomes i ON u.user_id = i.user_id AND i.date <= '2024-11-17'
LEFT JOIN expenses e ON u.user_id = e.user_id AND e.date <= '2024-11-17'
GROUP BY u.user_id;
