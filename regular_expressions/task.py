def check_car_id(car_id):
    alphabet = ['А', 'В', 'Е', 'К', 'М', 'Н', 'О', 'Р', 'С', 'Т', 'У', 'Х']
    if (len(car_id) == 8 or len(car_id) == 9) and car_id[1:4].isdigit() and car_id[:1] in alphabet and car_id[4:6].isalpha() and car_id[6:].isdigit():
        return f"Номер {car_id[:6]} валиден. Регион: {car_id[6:]}."
    else:
        return "Номер не валиден."

if __name__=="__main__":
    car_id = None
    while car_id != 'q':
        car_id = input("Введите номер машины или введите q для выхода:")
        if car_id != 'q': print(check_car_id(car_id))