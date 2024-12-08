CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    birth_date DATE NOT NULL,
    birth_time TIME NOT NULL
);

CREATE TABLE ForecastTypes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    monthly_price NUMERIC(10, 2) NOT NULL CHECK (monthly_price > 0)
);

CREATE TABLE Subscriptions (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES Users(id),
    forecast_type_id INT NOT NULL REFERENCES ForecastTypes(id),
    start_date DATE NOT NULL,
    duration_months INT NOT NULL CHECK (duration_months > 0),
    UNIQUE (user_id, forecast_type_id, start_date)
);
