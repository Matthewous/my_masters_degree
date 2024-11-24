WITH yearly_expenses AS (
    SELECT 
        u.family_id,
        u.user_id,
        SUM(e.amount) AS total_expense
    FROM users u
    JOIN expenses e ON u.user_id = e.user_id
    WHERE e.date >= DATE(NOW()) - INTERVAL 1 YEAR
    GROUP BY u.family_id, u.user_id
),
monthly_incomes AS (
    SELECT 
        u.family_id,
        u.user_id,
        SUM(i.amount) AS total_income
    FROM users u
    JOIN incomes i ON u.user_id = i.user_id
    WHERE i.date >= DATE(NOW()) - INTERVAL 1 MONTH
    GROUP BY u.family_id, u.user_id
),
max_yearly_expenses AS (
    SELECT 
        family_id,
        user_id AS max_expense_user_id,
        total_expense AS max_expense
    FROM yearly_expenses
    WHERE (family_id, total_expense) IN (
        SELECT 
            family_id, MAX(total_expense)
        FROM yearly_expenses
        GROUP BY family_id
    )
),
max_monthly_incomes AS (
    SELECT 
        family_id,
        user_id AS max_income_user_id,
        total_income AS max_income
    FROM monthly_incomes
    WHERE (family_id, total_income) IN (
        SELECT 
            family_id, MAX(total_income)
        FROM monthly_incomes
        GROUP BY family_id
    )
)
SELECT 
    e.family_id,
    e.max_expense_user_id,
    e.max_expense,
    i.max_income_user_id,
    i.max_income
FROM max_yearly_expenses e
JOIN max_monthly_incomes i ON e.family_id = i.family_id;
