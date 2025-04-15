import streamlit as st
import requests
import pandas as pd

st.set_page_config(layout='wide')

st.title("Employer Dashboard")

def fetch_employers():
    res = requests.get("http://api:4000/s/advisor/hire-frequency")
    if res.status_code == 200:
        return pd.DataFrame(res.json())
    return pd.DataFrame()

employers_df = fetch_employers()

if not employers_df.empty:
    st.dataframe(employers_df)
else:
    st.warning("No employers found")

def top_skills():
    res = requests.get("http://api:4000/s/advisor/top-skills")
    if res.status_code == 200:
        return pd.DataFrame(res.json())
    return pd.DataFrame()

employers_df = fetch_employers()

if not employers_df.empty:
    st.dataframe(employers_df)
else:
    st.warning("No employers found")