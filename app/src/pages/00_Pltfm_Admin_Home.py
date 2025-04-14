import logging
logger = logging.getLogger(__name__)

import streamlit as st
from modules.nav import SideBarLinks

st.set_page_config(layout='wide')

SideBarLinks()

st.title(f"Welcome Platform Admin, Jayson.")
st.write('')
st.write('')
st.write('### What would you like to do today?')

if st.button('Go to User Management', 
             type='primary',
             use_container_width=True):
    st.switch_page('pages/01_Usr_Mgmt.py')

if st.button('Go to Issue Report Tracker', 
             type='primary',
             use_container_width=True):
    st.switch_page('pages/02_Issue_Report_Tracker.py')

if st.button('Go to Job Posting Review', 
             type='primary',
             use_container_width=True):
    st.switch_page('pages/03_Job_Posting_Review.py')