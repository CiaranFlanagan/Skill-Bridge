import streamlit as st
import pandas as pd
import requests

st.set_page_config(layout='wide')
st.title("Candidate Filter & Resume Download")
st.info("All fields (Major, Minimum GPA, and Skills) are required to filter candidates.")
st.write("Filter students by major, GPA, and skills. Download resumes directly.")
st.markdown("---")

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
    if major:
        params["major"] = major
    if gpa is not None and gpa != 0.0:
        params["gpa"] = gpa
    if skills:
        skill_list = [s.strip() for s in skills.split(",") if s.strip()]
        for skill in skill_list:
            params.setdefault("skill", []).append(skill)
    try:
        res = requests.get("http://api:4000/e/filter-students", params=params)
        if res.status_code == 200:
            return pd.DataFrame(res.json())
    except Exception as e:
        st.error(f"Error fetching students: {e}")
    return pd.DataFrame()

def get_user_input():
    major = st.selectbox("Major", MAJORS, help="Select a major")
    gpa = st.number_input("Minimum GPA", min_value=0.0, max_value=4.0, step=0.1)
    skills = st.text_input("Skills (comma separated)", help="e.g. Python, SQL, Leadership")
    return major, gpa, skills

def display_students(students):
    if not students.empty:
        st.subheader("Matching Students")
        st.dataframe(students)
        for _, row in students.iterrows():
            with st.expander(f"{row['first_name']} {row['last_name']} (ID: {row['user_id']})", expanded=False):
                st.write(f"Major: {row['major']}")
                st.write(f"GPA: {row['gpa']}")
                st.write(f"Skills: {row['skills']}")
                resume_url = f"http://api:4000/e/students/{row['user_id']}/resume"
                st.markdown(f"[Download Resume]({resume_url})")
    else:
        st.info("No matching students found.")

major, gpa, skills = get_user_input()
if st.button("Search Candidates"):
    students = fetch_students(major, gpa, skills)
    display_students(students)
