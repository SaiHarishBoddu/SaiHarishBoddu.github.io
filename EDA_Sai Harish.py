# -*- coding: utf-8 -*-
"""Copy of 1_EDA as a group_S24.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1WU23B_09ewzzfahoPeZWKVfREmwMoWLp

# EDA as a group (Spring 2024)
----------------------------------------
* Dave Wanik - OPIM 5512: Data Science Using Python - University of Connecticut

**Your Name Here:**

Groups of four students - give feedback to at least one other person (everyone must receive feedback). First come, first serve!

The purpose of this assignment is to get you working with the two most common visualization libraries in Python, `matplotlib` (plt) and `seaborn` (sns).

# Rubric
* Each student will decide to use `matplotlib` or `seabron` or both.
* (10 pts) Find **FIVE** interesting examples blogs/websites where datasets are cleaned and/or  EDA is completed with `matplotlib` or `sns`. List and describe the sources that you used in a subheader with a short description of the website.
* (60 pts) Each student will use the dataset that is given to create a total of **TWO** interesting plots (using `matplotlib` or `sns` or a mix). and **ONE** interesting table for each data set ("Incentives by State" and "Efficiency by vehicle".) Each item must have a useful caption with a description of what the output shows and what insights can be derived.
* (20 pts) Students will post to HuskyCT forum for peer review - thoughtful comments MUST be given (what was good, what could be improved, something new that could be added.) Since this is a dirty dataset, I expect some comments to be about data cleaning!
* After posting their script for review for peer feedback (as both as shareable link viewable to anyone with the link and as an uploaded file to HuskyCT), students will compare each others code quality and captions (business value of plots and tables) and make a suggestions for improvement.

## Examples of common feedback items on HuskyCT
* "I like how you tried four different plots instead of just using one plot over and over again"
* "That way of cleaning that column was amazing - I'm going to try that on my script too - my way was too manual, yours was way cleaner"
* "Your caption for Figure 2 could be more clear - maybe say something like this..."
* "I think it would be interesting to redo Table 2 but group by variable X instead of Z, that way you could get a better understanding of..."
* "I think you could have made a more thougtful caption for Figure 1 - what is the real value of the plot?"

❌ Do not just blindly copy/paste AI-generated code - if I ask you to explain something you submit for credit and you can't do it, you get a 0 for the entire assignment. Make sure you understand what you are doing and come to office hours if you are stuck!

# Sources
Here is an example of a good source:
* [How to Perform Exploratory Data Analysis with Seaborn - Lorraine Lee](https://towardsdatascience.com/how-to-perform-exploratory-data-analysis-with-seaborn-97e3413e841d)
  * This article was useful because it had a thorough presentation on making plots for categorical and numeric data in seaborn and had lots of 'hackable' code for making subplots.

  You should have five cool sources!

https://towardsdatascience.com/data-visualization-using-matplotlib-16f1aae5ce70

This article explains how to install Matplotlib and goes into great depth about each plotting command.


https://www.kaggle.com/code/kanncaa1/time-series-prediction-tutorial-with-eda

A lesson on time series prediction, including data loading, data description, data cleaning, and data visualization, is given in this article.

https://realpython.com/python-histograms/

This article uses numpy, matplotlib, pandas, and seaborn to provide a thorough description of how to plot histograms in Python.

https://www.analyticsvidhya.com/blog/2022/07/step-by-step-exploratory-data-analysis-eda-using-python/

Using a variety of code snippets from loading libraries, reading datasets, analyzing data, checking for duplication, and implementing features, this article walks readers through the process of doing a thorough data exploration.

https://www.geeksforgeeks.org/python-introduction-matplotlib/

This article provides information on the types of matplotlibs like lineplot, barplot, histogram plot etc with a sample dataset.

EVs aren't going away, why not apply what you've learned about EDA to a cool new (dirty) dataset? There are two datasets from Wikipedia for you to check. You will make 3 cool outputs for each dataset, share it with your group (and get feedback!), then you will submit to me.

![pacifica](https://di-uploads-pod8.dealerinspire.com/ranchochryslerjeepdodgeram/uploads/2023/03/2023-Chrysler-Pacifica-SilverMist-Cityscape.jpeg)

## Read the data
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# mute setting with copying warning
pd.options.mode.chained_assignment = None  # default='warn'

"""# 🔵 Incentives by State

Take a look at this table - the primary key actually spans two or three columns - State and Type of PEV/Vehicle. And you already see that it's messy - look at Colarado vs. Connecticut! You will need to recode values using replace values.
"""

df_state = pd.read_html('https://en.wikipedia.org/wiki/Plug-in_electric_vehicles_in_the_United_States')[1]
df_state

"""I'll help you get started. Looks like we need to combine 'BEVs and PHEVs' and 'BEVs, PHEV'. We can just replace values to make this happen! Then we are ready to go!"""

# return unique values in column
df_state['Type of PEV/vehicle'].value_counts()

# replace value in column
df_state['Type of PEV/vehicle'].replace(['BEVs and PHEVs', 'BEVs, PHEV'], 'BEVs and PHEVs', inplace=True)
# check your work - it worked!
df_state['Type of PEV/vehicle'].value_counts()

"""Use this as inspiration to make three interesting outputs - at least one plot and at least one table.

## 🔴 Interesting Output 1
"""

import matplotlib.pyplot as plt
import seaborn as sns

plt.figure(figsize=(12, 6))
sns.barplot(x='Amount of incentive', y='State', data=df_state, errorbar=None)
plt.title('Total Incentives by State')
plt.xlabel('Amount of Incentive')
plt.ylabel('State')
plt.show()

# description : This bar plot visualizes the total incentives offered by each state. It provides a clear comparison of incentive amounts, allowing easy identification of states with the highest and lowest incentives.

"""## 🔴 Interesting Output 2"""

plt.figure(figsize=(10, 6))
sns.boxplot(x='Type of PEV/vehicle', y='Amount of incentive', data=df_state)
plt.title('Efficiency Distribution by Vehicle Type')
plt.xlabel('Type of PEV/Vehicle')
plt.ylabel('Amount of Incentive')
plt.show()

# Description : This box plot illustrates the distribution of incentives across different types of electric vehicles. It helps in understanding the variation in incentive amounts for Battery Electric Vehicles (BEVs), Plug-in Hybrid Electric Vehicles (PHEVs), and other vehicle types.



"""## 🔴 Interesting Output 3"""

import pandas as pd


# Replace NaN values in 'Amount of incentive' with 0
df_state['Amount of incentive'].fillna(0, inplace=True)

# Filter rows where 'Amount of incentive' is 0
no_incentive_states = df_state[df_state['Amount of incentive'] == 0]

# Extract unique states
states_with_no_incentive = no_incentive_states['State'].unique()

# Create a DataFrame with states having no incentive
no_incentive_table = pd.DataFrame({'State': states_with_no_incentive})

# Display the table
print(no_incentive_table)

"""# 🔵 Efficiency by vehicle"""

df_vehicle = pd.read_html('https://en.wikipedia.org/wiki/Plug-in_electric_vehicles_in_the_United_States')[4]
df_vehicle

"""I'll help you get started - real-world data is messy. See the header? See the last row? These will cause problems for you. The multi-index is ANNOYING for selecting the column you want, and the last row is a text cell that repeats for each column. This is a little advanced for new coders, but you have to have good instincts.

* https://towardsdatascience.com/how-to-flatten-multiindex-columns-and-rows-in-pandas-f5406c50e569
* https://stackoverflow.com/questions/26921651/how-to-delete-the-last-row-of-data-of-a-pandas-dataframe
"""

# drop the last row
df_vehicle = df_vehicle[:-1]

# collapse the multi-index
df_vehicle.columns = df_vehicle.columns.get_level_values(0)

# check your work
df_vehicle.head()

"""See how the data is dirty? You need to clean it up! Get rid of special characters like dollar signs, periods, commas and anything else that is annoying! I leave this to you to figure out."""

df_vehicle.columns

df_vehicle.info()

"""This one was hard for me too - there was a special character HIDING in this column name!"""

# look at how nasty this column name secretly is!
df_vehicle.columns[7]

# rename the column
df_vehicle.rename({df_vehicle.columns[7]  : 'Annual fuel cost'}, axis='columns', inplace=True)
# check your work
df_vehicle.head()

# remove special characters
df_vehicle['Annual fuel cost'] = df_vehicle['Annual fuel cost'].str.replace('$', '')
df_vehicle['Annual fuel cost'] = df_vehicle['Annual fuel cost'].str.replace('-', '')
df_vehicle['Annual fuel cost'] = df_vehicle['Annual fuel cost'].str.replace(',', '')
df_vehicle.head()

"""With special characters, the column is hiding as a string - so you can't do math on it! You need to convert in to numeric. And once it's numeric, you can make cool plots and compute summary stats."""

# convert column to numeric
df_vehicle['Annual fuel cost'] = pd.to_numeric(df_vehicle['Annual fuel cost'])
df_vehicle['Annual fuel cost'].hist()

"""I have given you most of the tools you need to be successul! Take your time and try to crack this dataset open. Use AI to help you make even more amazing outputs if you want, but you have to understand what you coded, don't just copy blindly.

## 🔴 Interesting Output 4
"""

import matplotlib.pyplot as plt

plt.figure(figsize=(12, 6))

# Filter out rows with missing values in 'Annual fuel cost'
filtered_data = df_vehicle.dropna(subset=['Annual fuel cost'])

# Plotting the bar chart
plt.bar(filtered_data['Model year'].astype(str), filtered_data['Annual fuel cost'].astype(float))

# Adding labels and title
plt.xlabel('Model Year')
plt.ylabel('Annual Fuel Cost')
plt.title('Bar Chart: Model Year vs. Annual Fuel Cost')

# Rotating x-axis labels for better visibility
plt.xticks(rotation=45, ha='right')

plt.show()

# Bar Chart: Model Year vs. Annual Fuel Cost: The chart displays the annual fuel cost for each model year, providing insights into how costs vary across different years.

#not part of the output 4

df_vehicle['Cost to drive 25 miles'] = df_vehicle['Cost to drive 25 miles'].str.replace('$', '')
df_vehicle['Cost to drive 25 miles'] = df_vehicle['Cost to drive 25 miles'].str.replace('-', '')
df_vehicle['Cost to drive 25 miles'] = df_vehicle['Cost to drive 25 miles'].str.replace(',', '')
df_vehicle.head()

"""## 🔴 Interesting Output 5"""

import seaborn as sns
import matplotlib.pyplot as plt

# Convert 'Model year' to numeric
df_vehicle['Model year'] = pd.to_numeric(df_vehicle['Model year'], errors='coerce')

# Convert 'Cost to drive 25 miles' to numeric after replacing NaN with 0
df_vehicle['Cost to drive 25 miles'] = pd.to_numeric(df_vehicle['Cost to drive 25 miles'], errors ='coerce')

plt.figure(figsize=(12, 6))

# Plotting the bar chart using Seaborn
sns.barplot(x=df_vehicle['Model year'], y=df_vehicle['Cost to drive 25 miles'].astype(float))

# Adding labels and title
plt.xlabel('Model Year')
plt.ylabel('Cost to Drive 25 Miles')
plt.title('Bar Chart: Model Year vs. Cost to Drive 25 Miles')

# Rotating x-axis labels for better visibility
plt.xticks(rotation=45, ha='right')

plt.show()

# Bar Chart: Model Year vs. Cost to Drive 25 Miles: The chart illustrates the relationship between model years and the associated cost to drive 25 miles, providing insights into potential trends or variations.

"""## 🔴 Interesting Output 6"""

import pandas as pd

# Selecting relevant columns for the table
operating_mode_table = df_vehicle[['Vehicle', 'Operating mode (AER)']]

# Display the operating mode table
print(operating_mode_table)

# The table shows a mapping between each vehicle and its respective operating mode as described by the 'Operating mode (AER)' column. This information provides insights into the different operating modes of electric and hybrid vehicles in the dataset.