import numpy as np
import matplotlib.pyplot as plt

# Создаем массив с абсциссами
x = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

# Вычисляем ординаты согласно нормальному распределению
y = 0.5 * x + np.random.normal(0, 1, 10)

# С помощью метода polyfit вычисляем параметры a* и b* наилучшей линейной регрессии
a, b = np.polyfit(x, y, 1)

# Создаем массив для истинной прямой
y_true = 0.5 * x

# Создаем массив для линейной регрессии
y_regression = a * x + b

# Выводим параметры a* и b*
print("a*: ", a)
print("b*: ", b)

# Строим график
plt.scatter(x, y, label='Random Points')
plt.plot(x, y_true, label='True Line')
plt.plot(x, y_regression, label='Regression Line')
plt.legend()
plt.xlabel('x')
plt.ylabel('y')
plt.title('Experimental Dependency')
plt.show()

# в файле chart.prg приведен сгенерированный график с  a* =  0.6411387397091886 b* =  -0.44330028088157253
