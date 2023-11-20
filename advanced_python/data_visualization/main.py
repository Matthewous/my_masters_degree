import pandas as pd
from pprint import pprint

filepath = '/Users/matthew/Documents/GitHub/my_masters_degree/data_visualization/tmdb_5000_movies.csv'

df = pd.read_csv(filepath)

pprint(df.head())