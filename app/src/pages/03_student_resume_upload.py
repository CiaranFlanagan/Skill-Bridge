import streamlit as st
import PyPDF2

st.title("Upload a PDF File")

# File uploader for PDF
uploaded_file = st.file_uploader("Choose a PDF file", type="pdf")

if uploaded_file is not None:
    # Read the PDF content
    reader = PyPDF2.PdfReader(uploaded_file)
    st.success("PDF uploaded successfully!")

    