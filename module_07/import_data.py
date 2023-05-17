import pymongo
import json

import_data = 'module_06/service_db_init/ExportJson.json'


# Create the client
client = pymongo.MongoClient('localhost', 27017, username = 'admin', password = 'admin')

# Connect to our database
db = client['college']

# Fetch our series collection
db_collection = db['authors']

def insert_data(collection, data):
    return collection.insert_many(data).inserted_ids


with open(import_data, 'r') as fp:
    data = json.load(fp)

i = 1
for item in data:
    item['_id'] = str(i)
    item['birth_year'] = item.get('birth_date')[:4]
    i += 1

print(insert_data(db_collection, data))