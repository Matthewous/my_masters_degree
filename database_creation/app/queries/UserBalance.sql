SELECT e.user_id, COUNT(e.expense_id) AS expense_count
FROM expenses e
WHERE e.category_id = 'category123'
GROUP BY e.user_id
HAVING COUNT(e.expense_id) >= 10;
