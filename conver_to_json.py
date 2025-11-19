import pandas as pd
import json
import ast
from pandas import json_normalize

# Step 1: Read the CSV
df = pd.read_csv('samiwatches.csv')

# Step 2: Convert any JSON-like strings in the dataframe to actual dicts
json_columns = []
for col in json_columns:
    df[col] = df[col].apply(lambda x: ast.literal_eval(x) if pd.notnull(x) else {})

# Step 3: Flatten the dataframe
flat_df = pd.json_normalize(df.to_dict(orient='records'))

# Step 4: Export flattened JSON
flat_df.to_json('jsonwatches_final_flat.json', orient='records', indent=4)

print("Flattened JSON saved to 'jsonwatches_final_flat.json'")
