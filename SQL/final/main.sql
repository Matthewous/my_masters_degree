
-- Задание 1
-- Вывести список сотрудников старше 65 лет.

SELECT fio, dob, EXTRACT(YEAR FROM age) AS age 
FROM (SELECT concat(last_name,' ', first_name, ' ' , middle_name) AS fio, dob, age(dob) AS age FROM person) sl
WHERE age > '65 years'

-- Задание 2
-- Вывести количество вакантных должностей. (Таблица с вакансиями может содержать недостоверные данные, решение должно быть без этой таблицы).

SELECT count(DISTINCT vac_id) AS countt FROM candidate
WHERE status != 'Принят на работу'

-- Задание 3
-- Вывести список проектов и количество сотрудников, задействованных на этих проектах.



-- Задание 4
-- Получить список сотрудников у которых было повышение заработной платы на 25%

SELECT emp_id, salary, prev_salary, change_percent 
FROM
(SELECT emp_id, salary, prev_salary, (salary - prev_salary) * 100 / prev_salary AS change_percent 
FROM
(SELECT emp_id, salary, lag(salary) OVER (PARTITION BY emp_id ORDER BY effective_from) AS prev_salary
FROM employee_salary es) sl) sl
WHERE change_percent = 25

-- Задание 5
-- Вывести среднее значение суммы договора на каждый год, округленное до сотых.

SELECT EXTRACT(YEAR FROM created_at) AS YEAR, round(avg(amount), 2) AS avg_amount
FROM projects
GROUP BY YEAR

-- Задание 6
-- Одним запросом вывести ФИО сотрудников с самым низким и самым высоким окладами за все время.

WITH salaries AS
(
SELECT concat(p.last_name,' ', p.first_name, ' ' , p.middle_name) AS fio, es.salary
FROM employee_salary es
JOIN employee e ON e.emp_id = es.emp_id
JOIN person p ON p.person_id = e.person_id
)
SELECT fio, min(salary) AS salary FROM salaries GROUP BY fio
UNION ALL
SELECT fio, max(salary) AS salary FROM salaries GROUP BY fio
ORDER BY fio, salary