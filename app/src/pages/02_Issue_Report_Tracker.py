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
    
st.write("### 📝 Update Report Status")

status_options = ["open", "in progress", "resolved", "closed"]

for _, row in filtered_df.iterrows():
        with st.expander(f"Report #{row['id']} - {row['type']} by {row['first_name']} {row['last_name']}"):
            st.write(f"**Email:** {row['email']}")
            st.write(f"**Submitted:** {row['date_created']}")
            st.write(f"**Description:** {row['description']}")

            if row["status"] in status_options:
                current_index = status_options.index(row["status"])
            else:
                current_index = 0  

            new_status = st.selectbox(
                "Update status",
                options=status_options,
                index=current_index,
                key=f"status_{row['id']}"
            )

            if st.button("✅ Save", key=f"save_{row['id']}"):
                res = requests.put(f"http://api:4000/ir/issue_reports/{row['id']}", json={
                    "status": new_status
                })
                if res.status_code == 200:
                    st.success("Status updated successfully!")
                    st.rerun()
                else:
                    st.error(f"Failed to update report: {res.status_code}")
    