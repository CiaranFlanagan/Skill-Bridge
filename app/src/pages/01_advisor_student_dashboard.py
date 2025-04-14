import sys
import streamlit as st
import pandas as pd
import requests
import matplotlib.pyplot as plt

st.title('Student Dashboard')
st.write('Manage your students on SkillBridge')

# Get a df of all the students

def fetch_students():
    res = requests.get(f"http://api:4000/s/students")
    if res.status_code == 200:
        return pd.DataFrame(res.json())
    return pd.DataFrame()

students_df = fetch_students()

if not students_df.empty:
    st.dataframe(students_df)
else:
    st.warning("No students found")

