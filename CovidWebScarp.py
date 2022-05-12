import requests

data = requests.get("https://api.covidtracking.com/v1/us/daily.json")
data_1 = data.json()
print(data_1)


import pandas as pd
data_2 = pd.DataFrame(data_1)

from sqlalchemy import create_engine
try:
    create = create_engine("mysql+pymysql://root:Ajith98$@localhost/webscrap1")
    data_2.to_csv("covid_data.csv")
    df = pd.read_csv("covid_data.csv",index_col=False)
    df.to_sql("mysql", create, if_exists="replace", index=False)
except:
    print("something went wrong")
