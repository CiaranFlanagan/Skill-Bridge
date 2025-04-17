import streamlit as st
import pandas as pd
import requests

st.title("Student Job Dashboard")
st.write("Find personalized job recommendations, see the latest postings, and explore top in-demand skills!")

st.header("Recommended Jobs for You")

student_id = st.text_input("Enter your Student ID", placeholder="e.g., 41")

if student_id:
    try:
        rec_res = requests.get(f"http://api:4000/stu/students/{student_id}/recommended-jobs")

        if rec_res.status_code == 200:
            rec_jobs_df = pd.DataFrame(rec_res.json())

            if not rec_jobs_df.empty:
                st.success(f"Found {len(rec_jobs_df)} recommended jobs!")
                st.dataframe(rec_jobs_df[["id", "title", "company_name", "posted_date"]])
            else:
                st.info("No recommended jobs found based on your profile.")
        else:
            st.error(f"Failed to fetch recommended jobs. Status code: {rec_res.status_code}")

    except Exception as e:
        st.error(f"An error occurred: {e}")

st.divider()

st.header("New Job Postings")

try:
    new_res = requests.get("http://api:4000/stu/students/new-jobs")

    if new_res.status_code == 200:
        new_jobs_df = pd.DataFrame(new_res.json())

        if not new_jobs_df.empty:
            st.dataframe(new_jobs_df[["id", "title", "company_name", "posted_date"]])
        else:
            st.info("No new jobs posted recently.")
    else:
        st.error(f"Failed to fetch new jobs. Status code: {new_res.status_code}")

except Exception as e:
    st.error(f"An error occurred: {e}")

st.divider()

st.header("📈 Top In-Demand Skills")

try:
    skills_res = requests.get("http://api:4000/stu/students/top-skills")

    if skills_res.status_code == 200:
        skills_df = pd.DataFrame(skills_res.json())

        if not skills_df.empty:
            st.dataframe(skills_df[["skill", "count"]])
        else:
            st.info("No skill data available.")
    else:
        st.error(f"Failed to fetch top skills. Status code: {skills_res.status_code}")

except Exception as e:
    st.error(f"An error occurred: {e}")
    
    
st.header("Apply to a Job")

with st.form("apply_to_job_form"):
    student_id = st.number_input("Enter your Student ID", min_value=1, step=1)
    job_id = st.number_input("Enter the Job ID you want to apply to", min_value=1, step=1)

    submit_application = st.form_submit_button("Apply Now")

    if submit_application:
        if student_id and job_id:
            res = requests.post(f"http://api:4000/stu/students/{student_id}/apply/{job_id}")
            if res.status_code == 201:
                st.success("Application submitted successfully!")
            else:
                st.error(f"Failed to apply. Status code: {res.status_code}")
        else:
            st.error("Please enter both your Student ID and Job ID.")