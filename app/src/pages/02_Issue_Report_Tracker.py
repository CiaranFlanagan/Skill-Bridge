import streamlit as st
import pandas as pd
import requests

st.title("🐞 Issue Report Tracker")
st.write("Review and manage issue reports submitted by users.")


def fetch_reports():
    res = requests.get("http://api:4000/ir/issue_reports")
    if res.status_code == 200:
        return pd.DataFrame(res.json())
    else:
        st.error(f"Failed to fetch issue reports: {res.status_code}")
        return pd.DataFrame()

reports_df = fetch_reports()

if not reports_df.empty:
    all_statuses = sorted(reports_df["status"].dropna().unique())
    selected_statuses = st.multiselect("Filter by status", all_statuses, default=all_statuses)

    filtered_df = reports_df[reports_df["status"].isin(selected_statuses)]

    st.write("### All Issue Reports")
    st.dataframe(filtered_df[[
        "id", "type", "status", "date_created", "description", "first_name", "last_name", "email"
    ]])
    