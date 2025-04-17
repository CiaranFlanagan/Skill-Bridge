import streamlit as st
from streamlit_extras.app_logo import add_logo
from modules.nav import SideBarLinks

SideBarLinks()

st.write("# About this App")

st.markdown (
    """
        ### About SkillBridge
        SkillBridge is a platform designed to connect students, employers, and advisors, fostering meaningful collaborations and career opportunities. 
    """
        )
