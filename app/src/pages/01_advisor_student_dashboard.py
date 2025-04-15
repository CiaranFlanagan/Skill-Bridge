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
    column_order = ['user_id', 'first_name', 'last_name', 'application_count', 'major_id', 'major_name', 'gpa', 'grad_date']
    if res.status_code == 200:
        df = pd.DataFrame(res.json())
        df = df[[col for col in column_order if col in df.columns]]
        return df
    return pd.DataFrame()

students_df = fetch_students()

if not students_df.empty:
    st.dataframe(students_df)
else:
    st.warning("No students found")

st.title("Alumni by Major")

# Create an empty list to store alumni rows
alumni_rows = []

# Loop over major IDs — not names!
unique_major_ids = students_df['major_id'].unique()

for major_id in unique_major_ids:
    res = requests.get(f"http://api:4000/s/advisor/alumni/{major_id}")
    if res.status_code == 200:
        alumni = res.json()
        alumni_rows.extend(alumni)  # each alum already includes major_name
    else:
        st.warning(f"Failed to fetch alumni for major_id {major_id}")

# Display final DataFrame
if alumni_rows:
    alumni_df = pd.DataFrame(alumni_rows)
    column_order = ["first_name", "last_name", "major_name", "grad_date"]
    alumni_df = alumni_df[[col for col in column_order if col in alumni_df.columns]]
    st.dataframe(alumni_df)
else:
    st.warning("No Alumni found")


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



                