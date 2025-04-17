import streamlit as st
import pandas as pd
import requests

st.title("📋 Application Tracker")
st.write("Enter your Student ID below to view all your applications.")

student_id = st.number_input("Student ID:", min_value=1, step=1)

if student_id:
    try:
        res = requests.get(f"http://api:4000/stu/students/{student_id}/applications")
        if res.status_code == 200:
            applications = res.json()

            if applications:
                apps_df = pd.DataFrame(applications)
                apps_df.rename(columns={
                    "application_id": "Application ID",
                    "job_title": "Job Title",
                    "company_name": "Company",
                    "date_applied": "Date Applied",
                    "status": "Status"
                }, inplace=True)

                st.write("### Your Applications")
                st.dataframe(apps_df)
            else:
                st.info("No applications found for this student.")
        else:
            st.error(f"Failed to fetch applications. Status code: {res.status_code}")
    except Exception as e:
        st.error(f"Error fetching applications: {e}")
