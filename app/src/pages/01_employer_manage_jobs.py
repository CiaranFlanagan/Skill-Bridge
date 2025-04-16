import streamlit as st
import pandas as pd
import requests

st.set_page_config(layout='wide')
st.title("Employer Job Management")
st.write("View, create, and manage your job postings.")
st.markdown("---")

employer_id = st.number_input("Employer ID", min_value=1, step=1, help="Enter your employer ID.")
search_clicked = st.button("Search Jobs")

def fetch_jobs(employer_id):
    url = f"http://api:4000/e/job-postings?employer_id={employer_id}"
    try:
        res = requests.get(url)
        if res.status_code == 200:
            return pd.DataFrame(res.json())
    except Exception as e:
        st.error(f"Error fetching jobs: {e}")
    return pd.DataFrame()

def create_job(employer_id, title, status):
    url = "http://api:4000/e/job-postings"
    try:
        resp = requests.post(url, json={"employer_id": employer_id, "title": title, "status": status})
        if resp.status_code == 201:
            st.session_state.pop("job_create_error", None)
            return True
        else:
            try:
                error_msg = resp.json().get('error', resp.text)
            except Exception:
                error_msg = resp.text
            st.session_state["job_create_error"] = f"Failed to create job: {error_msg}"
            return False
    except Exception as e:
        st.session_state["job_create_error"] = f"Error creating job: {e}"
    return False

def display_jobs(jobs):
    st.subheader("Your Job Postings")
    if not jobs.empty:
        st.dataframe(jobs)
        for _, row in jobs.iterrows():
            with st.expander(f"{row['title']} (ID: {row['id']})", expanded=False):
                st.write(f"Status: {row['status']}")
    else:
        st.info("No job postings found.")

def create_job_form(employer_id):
    st.markdown("---")
    st.subheader("Create New Job Posting")
    if "job_create_error" in st.session_state:
        st.error(st.session_state["job_create_error"])
    with st.form("create_job_form"):
        title = st.text_input("Job Title")
        status = st.selectbox("Status", ["open", "closed", "filled"])
        submitted = st.form_submit_button("Create Job")
        if submitted:
            if title and status:
                success = create_job(employer_id, title, status)
                if success:
                    st.success("Job created successfully!")
                    st.rerun()
                else:
                    st.error("Failed to create job.")
            else:
                st.warning("Please provide a job title and status.")

if employer_id:
    create_job_form(employer_id)

if search_clicked:
    if employer_id:
        jobs = fetch_jobs(employer_id)
        display_jobs(jobs)
    else:
        st.info("Please enter your employer ID above.")