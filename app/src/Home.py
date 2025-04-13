##################################################
# This is the main/entry-point file for the 
# sample application for your project
##################################################

# Set up basic logging infrastructure
import logging
logging.basicConfig(format='%(filename)s:%(lineno)s:%(levelname)s -- %(message)s', level=logging.INFO)
logger = logging.getLogger(__name__)

# import the main streamlit library as well
# as SideBarLinks function from src/modules folder
import streamlit as st
from modules.nav import SideBarLinks

# streamlit supports reguarl and wide layout (how the controls
# are organized/displayed on the screen).
st.set_page_config(layout = 'wide')

# If a user is at this page, we assume they are not 
# authenticated.  So we change the 'authenticated' value
# in the streamlit session_state to false. 
st.session_state['authenticated'] = False

# Use the SideBarLinks function from src/modules/nav.py to control
# the links displayed on the left-side panel. 
# IMPORTANT: ensure src/.streamlit/config.toml sets
# showSidebarNavigation = false in the [client] section
SideBarLinks(show_home=True)

# ***************************************************
#    The major content of this page
# ***************************************************

# set the title of the page and provide a simple prompt. 
logger.info("Loading the Home page of the app")
st.title('SKILL BRIDGE')
st.write('\n\n')
st.write('### HI! As which user would you like to log in?')

    
if st.button('Act as Jayson, a Platform Admin', 
            type='primary', 
            use_container_width=True):
    st.session_state['authenticated'] = True
    st.session_state['role'] = 'platform_admin'
    st.session_state['first_name'] = 'Alice'

    logger.info("Logging in as Platform Admin Persona")
    st.switch_page('pages/00_Pltfm_Admin_Home.py')

if st.button('Act as Sarah, a Career Advisor',
             type = 'primary',
             use_container_width=True):
    st.session_state['authenticated'] = True
    st.session_state['role'] = 'Advisor'
    st.session_state['first_name'] = 'Sarah'
    st.switch_page('pages/00_advisor.py')

if st.button('Act as John, a Employer',
             type = 'primary',
             use_container_width=True):
    st.session_state['authenticated'] = True
    st.session_state['role'] = 'Employer'
    st.session_state['first_name'] = 'John'
    st.switch_page('pages/00_advisor.py')

