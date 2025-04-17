import streamlit as st
import pandas as pd
import requests

st.set_page_config(layout='wide')
st.title("Employer Job Management")
st.write("View, create, and manage your job postings.")


if 'show_jobs' not in st.session_state:
    st.session_state['show_jobs'] = False

def search_jobs_click():
    st.session_state['show_jobs'] = True

employer_id = st.number_input("Employer ID", min_value=1, step=1, help="Enter your employer ID.")
st.button("Search Jobs", on_click=search_jobs_click)

def fetch_jobs(employer_id):
    url = f"http://web-api:4000/e/job-postings?employer_id={employer_id}"
    response = requests.get(url)
    if response.status_code == 200:
        return pd.DataFrame(response.json())
    return pd.DataFrame()

def create_job(employer_id, title, status):
    url = "http://web-api:4000/e/job-postings"
    resp = requests.post(url, json={"employer_id": employer_id, "title": title, "status": status})
    return resp.status_code == 201

def update_job(job_id, title, status):
    url = f"http://web-api:4000/e/job-postings/{job_id}"
    resp = requests.put(url, json={"title": title, "status": status})
    return resp.status_code == 200

def mark_job_filled(job_id):
    url = f"http://web-api:4000/e/job-postings/{job_id}/mark-filled"
    resp = requests.post(url)
    return resp.status_code == 200

def display_jobs(jobs):
    if jobs.empty:
        st.info("No job postings found.")
        return
    st.subheader("Your Job Postings")
    st.dataframe(jobs)
    status_options = ["open", "closed", "filled"]

    for index, row in jobs.iterrows():
        with st.expander(f"{row['title']} (ID: {row['id']})", expanded=False):
            st.write(f"Status: {row['status']}")

            with st.form(key=f"edit_job_{row['id']}"):
                new_title = st.text_input(
                    "Edit Title",
                    value=row['title'],
                    key=f"title_{row['id']}"
                )

                if row['status'] in status_options:
                    status_index = status_options.index(row['status'])
                else:
                    status_index = 0

                new_status = st.selectbox(
                    "Edit Status",
                    status_options,
                    index=status_index,
                    key=f"status_{row['id']}"
                )

                if st.form_submit_button(
                    "Update Job",
                    on_click=update_job,
                    args=(row['id'], new_title, new_status)
                ):
                    st.success("Job updated! Reload to see changes.")
                    st.rerun()

            if row['status'] != "filled":
                if st.button(f"Mark as Filled", key=f"mark_filled_{row['id']}"):
                    mark_job_filled(row['id'])
                    st.success("Job marked as filled! Reload to see changes.")
                    st.rerun()

def create_job_form(employer_id):
    st.markdown("---")
    st.subheader("Create New Job Posting")
    with st.form("create_job_form"):
        title = st.text_input("Job Title")
        status = st.selectbox("Status", ["open", "closed", "filled"])
        if st.form_submit_button("Create Job"):
            create_job(employer_id, title, status)
            st.success("Job created! Reload to see changes.")
            st.rerun()

if employer_id:
    create_job_form(employer_id)

if st.session_state['show_jobs'] and employer_id:
    jobs = fetch_jobs(employer_id)
    display_jobs(jobs)
elif not st.session_state['show_jobs']:
    st.info("Please enter your employer ID above and click 'Search Jobs'.")