import pandas as pd

# Загрузка данных из файлов
power_df = pd.read_csv('power.csv')
transactions_df = pd.read_csv('transactions.csv')

# Фильтрация данных для стран Прибалтики, категорий 4, 12 и 21, и периода с 2005 по 2010 год
filtered_power_df = power_df[(power_df['country'].isin(['Latvia', 'Lithuania', 'Estonia'])) &
                             (power_df['category'].isin([4, 12, 21])) &
                             (power_df['year'] >= 2005) & (power_df['year'] <= 2010) &
                             (power_df['quantity'] >= 0)]

filtered_transactions_df = transactions_df[(transactions_df['Year'] >= 2005) & (transactions_df['Year'] <= 2010)]

# Суммирование потребления
total_power_consumption = filtered_power_df['quantity'].sum()

# Вывод результата
print(f"Суммарное потребление стран Прибалтики (категории 4, 12 и 21) с 2005 по 2010 год: {total_power_consumption}")
