SELECT e.expense_id, e.user_id, e.category_id, e.amount, e.date
FROM expenses e
JOIN users u ON e.user_id = u.user_id
JOIN familymembers fm ON u.user_id = fm.user_id
JOIN families f ON fm.family_id = f.family_id
WHERE f.family_id = 1
  AND e.date BETWEEN '2024-01-01' AND '2024-12-31';