import pandas as pd
import matplotlib.pyplot as plt
df = pd.read_csv('supermarket_sales.csv', sep=',')

# Далее запишите ваш код
df['Date'] = pd.to_datetime(df['Date'])
df['Time'] = pd.to_datetime(df['Time'])

missing_pct = df.isnull().mean().sort_values(ascending=False)

# grouped = df.groupby('City')['Total'].sum().reset_index()

# print(grouped)

# daily_revenue = df.groupby(df['Date'].dt.date)['gross income'].sum().reset_index()

# plt.figure(figsize=(12, 6))
# plt.plot(daily_revenue['Date'], daily_revenue['gross income'])
# plt.xlabel('Date')
# plt.ylabel('Gross Income')
# plt.title('Динамика суммарного дохода по дням')
# plt.grid()
# plt.show()

weekly_revenue = df.groupby([pd.Grouper(key='Date', freq='W-MON'), 'Payment'])['Total'].sum().reset_index()

pivot_table = weekly_revenue.pivot(index='Date', columns='Payment', values='Total')

plt.figure(figsize=(12, 6))
pivot_table.plot()
plt.xlabel('Неделя')
plt.ylabel('Общий доход')
plt.title('Динамика общего дохода по методу')
plt.grid()
plt.show()

# product_sales = df.groupby('Product line')['Quantity'].sum().sort_values(ascending=False)

# most_popular_product = product_sales.index[0]
# total_sales = product_sales[0]

# print(f"Самый популярный товар: {most_popular_product}")
# print(f"Общее количество проданных единиц: {total_sales:.0f}")

# product_sales = df.groupby('Product line')['Quantity'].sum().sort_values(ascending=False)

# for product, total_sales in product_sales.items():
#     print(f"{product}: {total_sales:.0f}")

# avg_bill_by_payment = df.groupby(['Payment', 'Week'])['Total'].mean().reset_index()

# print("Динамика среднего чека по платежным методам:")
# for payment, group in avg_bill_by_payment.groupby('Payment'):
#     print(f"{payment}:")
# for week, row in group.iterrows():
#     print(f"Неделя {row['Week']}: {row['Total']:.2f}")
# print()

# third_week_avg_bills = avg_bill_by_payment[avg_bill_by_payment['Week'] == 3]['Total']
# min_avg_bill_payment = third_week_avg_bills.idxmin()
# print(f"Платежный метод с наименьшим средним чеком на 3-й неделе: {min_avg_bill_payment}")


# members_count = df[df['Customer type'] == 'Member'].shape[0]
# non_members_count = df[df['Customer type'] == 'Normal'].shape[0]
# total_count = members_count + non_members_count
# members_proportion = members_count / total_count
# non_members_proportion = non_members_count / total_count

# members_proportion = round(members_proportion, 3)
# non_members_proportion = round(non_members_proportion, 3)
# print(f"Доля покупателей-членов бонусной программы: {members_proportion}")
# print(f"Доля покупателей, не являющихся членами бонусной программы: {non_members_proportion}")
# print(f'Таким образом, доля покупателей-членов бонусной программы составляет {members_proportion}, а доля покупателей, не являющихся членами бонусной программы, составляет {non_members_proportion}.')

# avg_bill_by_payment = df.groupby('Payment')['Total'].mean().round(2)

# print("Средний чек по платежным методам:")
# for payment, avg_bill in avg_bill_by_payment.items():
#     print(f"{payment}: {avg_bill}")
# print(f'Результаты:{avg_bill_by_payment.to_string()}')