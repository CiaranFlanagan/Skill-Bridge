import streamlit as st
import requests

st.title("Resume Help")
st.write("Find your advisor and get feedback on your resume.")

# Student enters their ID
student_id = st.text_input("Enter your Student ID:")

if student_id:
    # Fetch advisor info
    advisor_res = requests.get(f"http://api:4000/stu/students/{student_id}/advisor")
    if advisor_res.status_code == 200:
        advisor = advisor_res.json()
        st.success(f"Your advisor is **{advisor['first_name']} {advisor['last_name']}** ({advisor['email']}).")
        st.markdown("Please email your resume to your advisor for feedback!")

        # Fetch resume feedback
        feedback_res = requests.get(f"http://api:4000/stu/students/{student_id}/resume_feedback")
        if feedback_res.status_code == 200:
            feedback = feedback_res.json()
            st.markdown("---")
            st.subheader("Latest Resume Feedback")
            st.markdown(f"**Score:** {feedback['score']}")
            st.markdown(f"**Feedback:** {feedback['feedback']}")
            st.markdown(f"_Last Updated: {feedback['upload_date']}_")
        else:
            st.info("No resume feedback available yet. Please check back later.")

    else:
        st.error("Advisor not found. Please double-check your Student ID.")