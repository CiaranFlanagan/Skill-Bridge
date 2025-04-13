import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout='wide')

SideBarLinks()

st.title(f"Welcome Employer, {st.session_state['first_name']}.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('Manage Job Postings', 
             type='primary',
             use_container_width=True):
    st.switch_page('pages/01_employer_manage_jobs.py')

if st.button('Find and Filter Candidates', 
             type='primary',
             use_container_width=True):
    st.switch_page('pages/02_employer_candidate_filter.py')

if st.button('Review Applications',
             type='primary',
             use_container_width=True):
    st.switch_page('pages/03_employer_app_review.py')