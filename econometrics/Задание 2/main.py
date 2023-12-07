from scipy.optimize import minimize

# Данные
r0 = 1
Er1 = 2
Er2 = 3
sigma_r1 = 2
sigma_r2 = 4
corr_r1_r2 = 1/2

# Определение функции для стандартного отклонения портфеля
def portfolio_std(w):
    sigma_p = (w[0]**2 * sigma_r1**2 + w[1]**2 * sigma_r2**2 + 2 * w[0] * w[1] * sigma_r1 * sigma_r2 * corr_r1_r2)**0.5
    return sigma_p

# Определение функции целевой оптимизации (максимизация прибыли)
def objective(w):
    return -(w[0] * Er1 + w[1] * Er2)

# Ограничения для случая отсутствия коротких продаж (все веса неотрицательны)
constraints_no_short = ({'type': 'ineq', 'fun': lambda w: w[0]},
                        {'type': 'ineq', 'fun': lambda w: w[1]},
                        {'type': 'eq', 'fun': lambda w: sum(w) - 1})

# Ограничения для случая наличия коротких продаж (веса могут быть отрицательными)
constraints_with_short = ({'type': 'eq', 'fun': lambda w: sum(w) - 1})

# Начальное предположение для оптимизации
initial_guess = [0.5, 0.5]  # Начнем с равного распределения активов

# Оптимизация без коротких продаж
result_no_short = minimize(objective, initial_guess, constraints=constraints_no_short)

# Оптимизация с короткими продажами
result_with_short = minimize(objective, initial_guess, constraints=constraints_with_short)

# Вывод результатов
if result_no_short.success:
    optimal_weights_no_short = result_no_short.x * 100  # Приведем к процентам
    print("Оптимальное распределение активов для максимизации прибыли без коротких продаж:")
    print(f"Aктив 1: {optimal_weights_no_short[0]:.2f}%")
    print(f"Aктив 2: {optimal_weights_no_short[1]:.2f}%")
else:
    print("Не удалось найти оптимальное распределение активов без коротких продаж.")

if result_with_short.success:
    optimal_weights_with_short = result_with_short.x * 100  # Приведем к процентам
    print("\nОптимальное распределение активов для максимизации прибыли с короткими продажами:")
    print(f"Aктив 1: {optimal_weights_with_short[0]:.2f}%")
    print(f"Aктив 2: {optimal_weights_with_short[1]:.2f}%")
else:
    print("Не удалось найти оптимальное распределение активов с короткими продажами.")
