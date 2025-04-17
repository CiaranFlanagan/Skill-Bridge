import streamlit as st
import pandas as pd
import requests

st.set_page_config(layout='wide')
st.title("Application Review")
st.write("View and update the status of applications to your job postings.")

if 'show_apps' not in st.session_state:
    st.session_state['show_apps'] = False

def search_click():
    st.session_state['show_apps'] = True

employer_id = st.number_input("Employer ID", min_value=1, step=1, help="Enter your employer ID.")
st.button("Search Applications", on_click=search_click)

def fetch_applications(employer_id):
    url = f"http://api:4000/e/applications?employer_id={employer_id}"
    response = requests.get(url)
    if response.status_code == 200:
        return pd.DataFrame(response.json())
    return pd.DataFrame()

def display_applications(application_list):
    st.subheader("Applications")
    st.dataframe(application_list)
    for _, application_info in application_list.iterrows():
        with st.expander(f"Application {application_info['id']} - {application_info['student_name']}", expanded=False):
            st.write(f"Status: {application_info['status']}")
            with st.form(key=f"form_{application_info['id']}"):
                status_options = ["pending", "approved", "rejected"]
                updated_status = st.selectbox(
                    "Update Status",
                    status_options,
                    key=f"status_{application_info['id']}_form",
                    index=status_options.index(application_info['status']) if application_info['status'] in status_options else 0
                )
                submitted = st.form_submit_button("Update")
                if submitted:
                    update_application(application_info['id'], updated_status)

def update_application(application_id, updated_status):
    response = requests.put(
        f"http://api:4000/e/applications/{application_id}/status",
        json={"status": updated_status}
    )
    st.success("Status has been updated! Reload to see changes.")    
if st.session_state['show_apps'] and employer_id:
    application_list = fetch_applications(employer_id)
    if not application_list.empty:
        display_applications(application_list)
    else:
        st.info("No applications found.")

elif not st.session_state['show_apps']:
    st.info("Please enter your employer ID above and click 'Search Applications'.")