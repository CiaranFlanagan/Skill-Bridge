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


# FIND ALUMNI
## IN PROGRESS
for _, row in students_df.iterrows():
    with st.expander(f"{row['first_name']} {row['last_name']}", expanded=False):
        col1= st.columns([3, 1])

        if st.button("Womp", key = f"delete_{row['alumni']}"):
            res = requests.delete(f"http://api:4000/s/advisor/alumni/{row['alumni']}")
            if res.status_code == 200:
                st.success("Student deleted successfully")
                st.rerun()
            else:
                st.error("Failed to delete student")


# DELETE STUDENTS

st.subheader("Delete Graduated Students")
for _, row in students_df.iterrows():
    with st.expander(f"{row['first_name']} {row['last_name']} ({row['grad_date']})", expanded=False):
        col1= st.columns([3, 1])

        if st.button("Delete User", key = f"delete_{row['user_id']}"):
            res = requests.delete(f"http://api:4000/u/users/{row['user_id']}")
            if res.status_code == 200:
                st.success("Student deleted successfully")
                st.rerun()
            else:
                st.error("Failed to delete student")



                