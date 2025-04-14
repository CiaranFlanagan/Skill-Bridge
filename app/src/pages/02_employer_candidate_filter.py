import streamlit as st
import pandas as pd
import requests

st.set_page_config(layout='wide')
st.title("View Student Resume")

st.write("Enter a student ID to fetch their resume.")

# get the input for student ID
student_id = st.number_input("Student ID", min_value=1, step=1)

# retrive the resume if ID is entered
if student_id:
    res = requests.get(f"http://api:4000/e/resumes/{student_id}")
    
    if res.status_code == 200:
        data = res.json()
        st.subheader(f"Resume for {data['first_name']} {data['last_name']} (Resume ID: {data['resume_id']})")
        st.code(data['resume'], language='text')
    else:
        st.warning("Resume was not found or invalid student ID typed in.")
