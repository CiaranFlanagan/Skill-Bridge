import streamlit as st
import pandas as pd
import requests

st.set_page_config(layout='wide')
st.title("Application Review")
st.write("View and update the status of applications to your job postings.")
st.markdown("---")

employer_id = st.number_input("Employer ID", min_value=1, step=1, help="Enter your employer ID.")
search_clicked = st.button("Search Applications")

def fetch_applications(employer_id):
    url = f"http://api:4000/e/applications?employer_id={employer_id}"
    try:
        res = requests.get(url)
        if res.status_code == 200:
            return pd.DataFrame(res.json())
    except Exception as e:
        st.error(f"Error fetching applications: {e}")
    return pd.DataFrame()

def display_applications(apps):
    st.subheader("Applications")
    st.dataframe(apps)
    for _, row in apps.iterrows():
        with st.expander(f"Application {row['id']} - {row['student_name']}", expanded=False):
            st.write(f"Status: {row['status']}")
            new_status = st.selectbox("Update Status", ["pending", "accepted", "rejected"], key=f"status_{row['id']}")
            if st.button("Update", key=f"update_{row['id']}"):
                update_application(row['id'], new_status)

def update_application(app_id, new_status):
    resp = requests.put(
        f"http://api:4000/e/applications/{app_id}",
        json={"status": new_status}
    )
    if resp.status_code == 200:
        st.success("Status updated!")
        st.rerun()
    else:
        st.error("Failed to update status.")

if search_clicked:
    if employer_id:
        apps = fetch_applications(employer_id)
        if not apps.empty:
            display_applications(apps)
        else:
            st.info("No applications found.")
    else:
        st.info("Please enter your employer ID above.")