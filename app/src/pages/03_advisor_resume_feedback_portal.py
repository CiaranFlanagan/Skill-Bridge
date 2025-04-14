import streamlit as st
import requests
from datetime import date

st.title("Submit Feedback on Resume")

# Fetch advisors
def get_advisors():
    res = requests.get("http://api:4000/advisor/all")
    if res.status_code == 200:
        return res.json()
    return []

# Fetch resumes
def get_resumes():
    res = requests.get("http://api:4000/resumes/all")
    if res.status_code == 200:
        return res.json()
    return []

advisors = get_advisors()
resumes = get_resumes()

advisor_options = {f"{a['first_name']} {a['last_name']} (ID: {a['id']})": a['id'] for a in advisors}
resume_options = {f"Resume ID: {r['id']} (Name: {r['first_name']} {r['last_name']})": r['id'] for r in resumes}

advisor_id = st.selectbox("Select Advisor", options=list(advisor_options.keys()))
resume_id = st.selectbox("Select Resume", options=list(resume_options.keys()))

score = st.slider("Score", min_value=1, max_value=10)
feedback = st.text_area("Feedback")
upload_date = st.date_input("Upload Date", value=date.today())

if st.button("Submit Feedback"):
    payload = {
        "advisor_id": advisor_options[advisor_id],
        "resume_id": resume_options[resume_id],
        "upload_date": upload_date.isoformat(),
        "score": score,
        "feedback": feedback
    }

    res = requests.post("http://api:4000/advisor/feedback", json=payload)

    if res.status_code == 201:
        st.success("Feedback Submitted Successfully!")
    else:
        st.error("Failed to submit feedback.")
