# import pandas as pd


# movies = pd.read_csv('/Users/matthew/Documents/GitHub/my_masters_degree/pandas/first_task/movies.csv')
# ratings = pd.read_csv('/Users/matthew/Documents/GitHub/my_masters_degree/pandas/first_task/ratings.csv')

import pandas as pd

# Загрузка данных из файлов
movies_df = pd.read_csv('movies.csv')
ratings_df = pd.read_csv('ratings.csv')

# Объединение данных по столбцу movieid
merged_df = pd.merge(ratings_df, movies_df, on='movieId')

# Фильтрация данных для оценок 5.0
high_ratings_df = merged_df[merged_df['rating'] == 5.0]

# Подсчет количества оценок 5.0 для каждого фильма
most_rated_movie = high_ratings_df['title'].value_counts().idxmax()

# Вывод результата
print(f"Фильм с наибольшим количеством оценок 5.0: {most_rated_movie}")