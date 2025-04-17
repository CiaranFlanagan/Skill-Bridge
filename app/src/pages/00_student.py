import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout='wide')

SideBarLinks()

st.title(f"Welcome Student, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('Job Dashboard', 
             type='primary',
             use_container_width=True):
    st.switch_page('pages/01_student_job_dashboard.py')

if st.button('Application Status', 
             type='primary',
             use_container_width=True):
    st.switch_page('pages/02_student_app_status.py')

if st.button('Resume Upload',
             type='primary',
             use_container_width=True):
    st.switch_page('pages/03_student_resume_upload.py')



    