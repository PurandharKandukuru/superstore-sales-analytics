import pandas as pd

df = pd.read_csv("Sample - Superstore.csv", encoding='latin1')

print("Shape before cleaning:", df.shape)
print("Nulls:")
print(df.isnull().sum())

df = df.drop_duplicates()
df = df.dropna(subset=['Sales', 'Profit'])

df['Order Date'] = pd.to_datetime(df['Order Date'])
df['Ship Date'] = pd.to_datetime(df['Ship Date'])

print("Shape after cleaning:", df.shape)
print("Profit by Category:")
print(df.groupby('Category')['Profit'].mean())
print("Sales by Region:")
print(df.groupby('Region')['Sales'].sum())

df.to_csv("superstore_cleaned.csv", index=False)
print("Saved cleaned file: superstore_cleaned.csv")