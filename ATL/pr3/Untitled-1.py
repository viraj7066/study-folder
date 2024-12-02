# %%
import pandas as pd 
covid_data= pd.read_csv('covid_19_data.csv') 
print("\nDataset First Five Rows:") 
print(covid_data.head(5)) 
print("\nDataset Information :") 
print(covid_data.info()) 
print("\nMissing data information:") 
print(covid_data.isna().sum())

# %%
import pandas as pd

# Read the CSV file
covid_data = pd.read_csv('covid_19_data.csv')

# Calculate the Active cases
covid_data['Active'] = covid_data['Confirmed'] - covid_data['Deaths'] - covid_data['Recovered']

# Group data by 'Country/Region' and calculate the sum for each category
result = covid_data.groupby('Country/Region')[['Confirmed', 'Deaths', 'Recovered', 'Active']].sum().reset_index()

# Print the result
print(result)


# %%
import pandas as pd 
covid_data= pd.read_csv('covid_19_data.csv') 
data = covid_data.groupby(['Country/Region', 
'Province/State'])[['Confirmed', 'Deaths', 'Recovered']].max() 
pd.set_option('display.max_rows', 
None) 
print(data) 

# %%
import pandas as pd 
covid_data= pd.read_csv('covid_19_data.csv') 
c_data = covid_data[covid_data['Country/Region']=='Mainland China'] 
c_data = c_data[['Province/State', 'Confirmed', 'Deaths', 'Recovered']] 
result = c_data.sort_values(by='Confirmed', ascending=False) 
result = result.reset_index(drop=True) 
print(result) 

# %%
import pandas as pd 
covid_data= pd.read_csv('covid_19_data.csv') 
data = covid_data.groupby('Country/Region')[['Confirmed', 'Deaths', 
'Recovered']].sum().reset_index()
result = data[data['Recovered']==0][['Country/Region', 'Confirmed', 'Deaths', 'Recovered']] 
print(result)

# %%
import pandas as pd 
covid_data= pd.read_csv('covid_19_data.csv', usecols = ['Last Update', 'Country/Region', 
'Confirmed', 'Deaths', 'Recovered']) 
result = covid_data.groupby('Country/Region').max().sort_values(by='Confirmed', 
ascending=False)[:10] 
pd.set_option('display.max_column', None) 
print(result) 

# %%
import pandas as pd 
import matplotlib.pyplot as plt 
covid_data= pd.read_csv('covid_19_data.csv', usecols = ['Last Update', 'Country/Region', 'Confirmed', 
'Deaths', 'Recovered']) 
covid_data['Active'] = covid_data['Confirmed'] - covid_data['Deaths'] - covid_data['Recovered'] 
 
r_data = covid_data.groupby(["Country/Region"])[["Deaths", "Confirmed", "Recovered", 
"Active"]].sum().reset_index() 
53 
 
r_data = r_data.sort_values(by='Deaths', ascending=False)
r_data = r_data[r_data['Deaths']>50] 
plt.figure(figsize=(15, 5)) 
plt.plot(r_data['Country/Region'], r_data['Deaths'],color='red') 
plt.plot(r_data['Country/Region'], r_data['Confirmed'],color='green') 
plt.plot(r_data['Country/Region'], r_data['Recovered'], color='blue') 
plt.plot(r_data['Country/Region'], r_data['Active'], color='black') 
 
plt.title('Total Deaths(>150), Confirmed, Recovered and Active Cases by Country') 
plt.show()


