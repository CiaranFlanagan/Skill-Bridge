import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout='wide')

SideBarLinks()

st.title(f"Welcome Career Advisor, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('Go to Student Dashboard', 
             type='primary',
             use_container_width=True):
    st.switch_page('pages/01_advisor_student_dashboard.py')

if st.button('Go to Company Dashboard', 
             type='primary',
             use_container_width=True):
    st.switch_page('pages/02_advisor_employer_dashboard.py')

if st.button('Resume Feedback Portal', 
             type='primary',
             use_container_width=True):
    st.switch_page('pages/03_advisor_resume_feedback_portal.py')