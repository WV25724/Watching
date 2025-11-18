import csv
import pandas as pd
import json


df = pd.read_csv('samiwatches.csv')

json_df = df.to_json('jsonwatches_test.json')

with open('jsonwatches_test.json', 'r') as f:
    data = json.load(f)

with open('jsonwatches_final.json', 'w') as f:
    json.dump(data, f, indent=4)
