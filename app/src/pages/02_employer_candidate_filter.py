import streamlit as st
import pandas as pd
import requests

st.set_page_config(layout='wide')
st.title("Candidate Filter & Resume Download")
st.info("You may filter by any combination of Major, Minimum GPA, and Skills.")
st.write("Filter students by major, GPA, and skills. Download resumes directly.")

MAJORS = [
    "Computer Science", "Business Administration", "Electrical Engineering", "Psychology", "Mechanical Engineering",
    "Biology", "Economics", "Chemistry", "Mathematics", "Communications", "Political Science", "Nursing",
    "English Literature", "Physics", "Marketing", "History", "Sociology", "Civil Engineering", "Finance",
    "Graphic Design", "Architecture", "Anthropology", "Philosophy", "Music", "International Relations",
    "Environmental Science", "Accounting", "Criminal Justice", "Data Science", "Journalism", "Education",
    "Biochemistry", "Art History", "Computer Engineering", "Information Technology", "Human Resources",
    "Linguistics", "Geography", "Public Health", "Aerospace Engineering"
]

def fetch_students(major=None, gpa=None, skills=None):
    params = {}
    if major and major != "Any":
        params["major"] = major
    if gpa is not None and gpa != 0.0:
        params["gpa"] = gpa
    if skills and skills.strip():
        skill_list = [s.strip() for s in skills.split(",") if s.strip()]
        if skill_list:
            params["skills"] = skill_list
    params["employer_id"] = 1
    response = requests.get("http://api:4000/e/filter-students", params=params)
    if response.status_code == 200:
        return pd.DataFrame(response.json())
    return pd.DataFrame()

def get_user_input():
    major = st.selectbox("Major", ["Any"] + MAJORS, help="Select a major or Any")
    gpa = st.number_input("Minimum GPA (optional)", min_value=0.0, max_value=4.0, step=0.1)
    skills = st.text_input("Skills (comma separated, optional)", help="e.g. Python, SQL, Leadership")
    return major, gpa, skills

def display_students(students):
    if students.empty:
        st.info("No matching students found.")
        return
    st.subheader("Matching Students")
    for idx, row in students.iterrows():

        expander_label = f"{row['first_name']} {row['last_name']} (ID: {row['user_id']})"
        with st.expander(expander_label, expanded=False):

            st.write(f"Major: {row['major_name'] if 'major_name' in row else row.get('major', '')}")
            st.write(f"GPA: {row['gpa']}")
            st.write(f"Skills: {row['skills']}")


major, gpa, skills = get_user_input()
if st.button("Search Candidates"):

    if major == "Any":
        search_major = None
    else:
        search_major = major

    if gpa == 0.0:
        search_gpa = None
    else:
        search_gpa = gpa

    if skills.strip():
        search_skills = skills
    else:
        search_skills = None


    students = fetch_students(search_major, search_gpa, search_skills)
    display_students(students)
