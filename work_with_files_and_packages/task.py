file_path = 'purchase_log.txt'

# добавляем элементы в словаря purchases
with open(file_path, 'r') as file:
    purchases = {}
    for line in file:
        user = eval(file.readline())
        purchases[user['user_id']]=user['category']

# выводим элементы словаря purchases
for key, value in purchases.items():
    print(f'{key} {value}')

