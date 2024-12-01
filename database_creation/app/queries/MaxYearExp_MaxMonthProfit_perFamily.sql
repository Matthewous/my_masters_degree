WITH yearly_expenses AS (
    SELECT 
        fm.family_id,
        u.user_id,
        SUM(e.amount) AS total_expense
    FROM familymembers fm
    JOIN users u ON fm.user_id = u.user_id
    JOIN expenses e ON u.user_id = e.user_id
    WHERE e.date >= NOW() - INTERVAL '1 YEAR'
    GROUP BY fm.family_id, u.user_id
),
monthly_incomes AS (
    SELECT 
        fm.family_id,
        u.user_id,
        SUM(i.amount) AS total_income
    FROM familymembers fm
    JOIN users u ON fm.user_id = u.user_id
    JOIN incomes i ON u.user_id = i.user_id
    WHERE i.date >= NOW() - INTERVAL '1 MONTH'
    GROUP BY fm.family_id, u.user_id
),
max_yearly_expenses AS (
    SELECT DISTINCT ON (family_id) 
        family_id,
        user_id AS max_expense_user_id,
        total_expense
    FROM yearly_expenses
    ORDER BY family_id, total_expense DESC
),
max_monthly_incomes AS (
    SELECT DISTINCT ON (family_id)
        family_id,
        user_id AS max_income_user_id,
        total_income
    FROM monthly_incomes
    ORDER BY family_id, total_income DESC
)
SELECT 
    e.family_id,
    e.max_expense_user_id,
    e.total_expense AS max_expense,
    i.max_income_user_id,
    i.total_income AS max_income
FROM max_yearly_expenses e
JOIN max_monthly_incomes i ON e.family_id = i.family_id;
