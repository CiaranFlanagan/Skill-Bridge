import streamlit as st
import requests
import pandas as pd

st.set_page_config(layout='wide')

st.title("Employer Dashboard")

st.write('Our Top Employers')

def fetch_employers_frequency():
    res = requests.get("http://api:4000/s/advisor/hire-frequency")
    if res.status_code == 200:
        return pd.DataFrame(res.json())
    return pd.DataFrame()

employers_df = fetch_employers_frequency()

if not employers_df.empty:
    st.dataframe(employers_df)
else:
    st.warning("No employers found")

st.write('Top Skills for Students')

def top_skills():
    res = requests.get("http://api:4000/s/advisor/top-skills")
    column_order = ['name', 'frequency']
    if res.status_code == 200:
        df = pd.DataFrame(res.json())
        df = df[[col for col in column_order if col in df.columns]]
        return df

    return pd.DataFrame(columns=column_order)

employers_df = top_skills()

if not employers_df.empty:
    st.dataframe(employers_df)
else:
    st.warning("No employers found")