#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Feb  5 17:28:01 2020

@author: andrewleonard
"""

import numpy as np
import pandas as pd
import seaborn as sns

grocery = pd.read_csv('/Users/andrewleonard/Library/Mobile Documents/com~apple~CloudDocs/Grad School/Data Engineering/Final Project/Grocery_Stores-csv.csv')

grocery.head()

num_stores = grocery['STORE NAME'].value_counts()

grocery['Number_Chain_Stores'] = 'NaN'

for i in range(0,len(grocery)):
    for j in range(0,len(num_stores)):
        if grocery['STORE NAME'][i] == num_stores.index[j]:
            grocery['Number_Chain_Stores'][i] = num_stores[j]
        
grocery['Liquor Store'] = 'NaN'

for i in range(0,len(grocery)):
    if 'Liquor' in grocery['STORE NAME'][i]:
        grocery['Liquor Store'][i] = 1
    else:
        grocery['Liquor Store'][i] = 0

#number of stores w/ Liquor in name
grocery['Liquor Store'].sum()

#number of non-chain stores
(grocery['Number_Chain_Stores'] < 2).sum()

#histogram of store square footage
sns.distplot(grocery['SQUARE FEET'], bins = 12, kde = False)

grocery['SQUARE FEET'].max()
grocery['SQUARE FEET'].min()
grocery['SQUARE FEET'].quantile([.25,.5,.75])

#classify stores by chain, large, small. Chose 10,000 square foot cutoff based off histogram
chainstores = grocery[grocery['Number_Chain_Stores'] > 1]
largestores = grocery[(grocery['SQUARE FEET'] > 10000) & (grocery['Number_Chain_Stores'] < 2)]
smallstores = grocery[(grocery['SQUARE FEET'] <= 10000) & (grocery['Number_Chain_Stores'] < 2)]

#number of stores in each subset
len(chainstores)
len(largestores)
len(smallstores)
#need to re-group Food for Less

#liquor stores in subsets
chainstores['Liquor Store'].sum()
largestores['Liquor Store'].sum()
smallstores['Liquor Store'].sum()

#mean size of stores by classified subsets
chainstores['SQUARE FEET'].mean()
largestores['SQUARE FEET'].mean()
smallstores['SQUARE FEET'].mean()

#variation in store sizes
chainstores['SQUARE FEET'].std()
largestores['SQUARE FEET'].std()
smallstores['SQUARE FEET'].std()


