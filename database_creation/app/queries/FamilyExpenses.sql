SELECT e.expense_id, e.user_id, e.category_id, e.amount, e.date
FROM expenses e
JOIN users u ON e.user_id = u.user_id
WHERE u.family_id = 'family123'
  AND e.date BETWEEN '2024-01-01' AND '2024-12-31';
