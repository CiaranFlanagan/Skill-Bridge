import streamlit as st
import pandas as pd
import requests

st.title("📂 Job Posting Review")
st.write("View, update, and remove job postings from the platform.")

# Fetch job postings
def fetch_job_postings():
    res = requests.get("http://api:4000/j/job_postings")
    if res.status_code == 200:
        return pd.DataFrame(res.json())
    else:
        st.error(f"Failed to fetch job postings: {res.status_code}")
        return pd.DataFrame()

df = fetch_job_postings()

if not df.empty:
    st.write("### Filter Job Postings")

    status_options = sorted(df['status'].dropna().unique())
    selected_statuses = st.multiselect("Filter by status", status_options, default=status_options)

    flagged_filter = st.checkbox("Show only flagged postings", value=False)

    filtered_df = df[df['status'].isin(selected_statuses)]
    if flagged_filter:
        filtered_df = filtered_df[filtered_df['flagged'] == 1]

    st.dataframe(filtered_df[['id', 'title', 'status', 'flagged', 'posted_date', 'company_name', 'email']])

    st.write("### 🛠 Manage Job Postings")
    for _, row in filtered_df.iterrows():
        with st.expander(f"{row['title']} @ {row['company_name']} ({row['email']})"):
            st.write(f"**Posted on:** {row['posted_date']}")
            new_status = st.selectbox(
                "Update Status",
                options=["active", "inactive", "pending"],
                index=["active", "inactive", "pending"].index(row['status']),
                key=f"status_{row['id']}"
            )

            new_flagged = st.checkbox(
                "Flag this posting?",
                value=bool(row["flagged"]),
                key=f"flagged_{row['id']}"
            )

            if st.button("💾 Save Changes", key=f"save_{row['id']}"):
                res = requests.put(f"http://api:4000/j/job_postings/{row['id']}", json={
                    "status": new_status,
                    "flagged": new_flagged
                })
                if res.status_code == 200:
                    st.success("Job posting updated.")
                    st.rerun()
                else:
                    st.error(f"Failed to update job posting: {res.status_code}")

            if st.button("🗑 Delete Posting", key=f"delete_{row['id']}"):
                res = requests.delete(f"http://api:4000/j/job_postings/{row['id']}")
                if res.status_code == 200:
                    st.success("Job posting deleted.")
                    st.rerun()
                else:
                    st.error(f"Failed to delete job posting: {res.status_code}")
else:
    st.info("No job postings available.")
