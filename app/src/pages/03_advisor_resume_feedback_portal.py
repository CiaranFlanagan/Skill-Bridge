import streamlit as st
import requests
from datetime import date

st.title("Submit Feedback on Resume")

# Fetch advisors
def get_advisors():
    res = requests.get("http://api:4000/s/advisor/all")
    if res.status_code == 200:
        return res.json()
    return []

# Fetch resumes
def get_resumes():
    res = requests.get("http://api:4000/s/resumes/all")
    if res.status_code == 200:
        return res.json()
    return []

advisors = get_advisors()
resumes = get_resumes()

# Build display-to-ID maps
advisor_options = {f"{a['first_name']} {a['last_name']}": a['id'] for a in advisors}
resume_options = {f"{r['first_name']} {r['last_name']}": r['id'] for r in resumes}

# Select box returns the display name
selected_advisor = st.selectbox("Select Advisor", list(advisor_options.keys()))
selected_resume = st.selectbox("Select Resume", list(resume_options.keys()))

score = st.slider("Score", min_value=1, max_value=10)
feedback = st.text_area("Feedback")
upload_date = st.date_input("Upload Date", value=date.today())

if st.button("Submit Feedback"):
    payload = {
        "advisor_id": advisor_options[selected_advisor],
        "resume_id": resume_options[selected_resume],
        "upload_date": upload_date.isoformat(),
        "score": score,
        "feedback": feedback
        
    }

    res = requests.post("http://api:4000/s/advisor/feedback", json=payload)

    if res.status_code == 201:
        st.success("Feedback Submitted Successfully!")
    else:
        st.error("Failed to submit feedback.")
        st.write(res.text)
