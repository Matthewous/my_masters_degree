-- Таблица для пользователей
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Таблица для доходов
CREATE TABLE Incomes (
    income_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    amount DECIMAL(15, 2) NOT NULL CHECK (amount >= 0),
    date DATE NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Таблица для расходов
CREATE TABLE Expenses (
    expense_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    amount DECIMAL(15, 2) NOT NULL CHECK (amount >= 0),
    date DATE NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Таблица для категорий
CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- Таблица для бюджетов
CREATE TABLE Budgets (
    budget_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    period_start DATE NOT NULL,
    period_end DATE NOT NULL,
    planned_amount DECIMAL(15, 2) NOT NULL CHECK (planned_amount >= 0),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Таблица для семей
CREATE TABLE Families (
    family_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Таблица для связи пользователей и семей (N:1)
CREATE TABLE FamilyMembers (
    family_id INT NOT NULL,
    user_id INT NOT NULL UNIQUE,
    PRIMARY KEY (family_id, user_id),
    FOREIGN KEY (family_id) REFERENCES Families(family_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
