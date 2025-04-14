import streamlit as st
import pandas as pd
import requests
import matplotlib.pyplot as plt

st.title('📋 User Management')
st.write('View, edit, add, and deactivate users on SkillBridge.')

# Get a df of all users

def fetch_users():
    res = requests.get(f"http://api:4000/u/users")
    if res.status_code == 200:
        return pd.DataFrame(res.json())
    return pd.DataFrame()

users_df = fetch_users()
    
if not users_df.empty:
    st.dataframe(users_df)
else:
    st.warning("No users found")
    
# add and delete user form
with st.expander("➕ Add New User", expanded=False):
    st.subheader("Add New User")

    with st.form("add_user_form", clear_on_submit=True):
        col1, col2 = st.columns(2)

        with col1:
            first_name = st.text_input("First Name")
            email = st.text_input("Email")
            role = st.selectbox("Role", ["student", "employer", "advisor", "admin"])

        with col2:
            last_name = st.text_input("Last Name")
            status = st.selectbox("Status", ["active", "inactive", "pending", "suspended"])

        submitted = st.form_submit_button("Add User")

        if submitted:
            if not all([first_name, last_name, email]):
                st.error("Please fill out all fields.")
            else:
                response = requests.post("http://api:4000/u/users", json={
                    "first_name": first_name,
                    "last_name": last_name,
                    "email": email,
                    "role": role,
                    "status": status
                })

                if response.status_code == 201:
                    st.success("✅ User added successfully!")
                    st.rerun()
                else:
                    st.error(f"❌ Failed to add user. Status code: {response.status_code}")
                    
                
### test the delete endpoint
# res = requests.delete("http://api:4000/u/users/1")
# st.write("Status code:", res.status_code)
# st.write("Response text:", res.text)
### need to change to on delete cascade
  
                
#edit and delete users

st.subheader("✏️ Edit or ❌ Delete Users")

search_user = st.text_input("Search User by ID")

if search_user:
    if search_user.isdigit():
        result_df = users_df[users_df['id'] == int(search_user)]
    else:
        result_df = pd.DataFrame()
else:
    page_lim = 10
    total_users = len(users_df)
    num_pages = (total_users // page_lim)
    if ((total_users % page_lim) > 0):
        num_pages += 1

    current_page = st.number_input("Page", min_value=1, max_value=num_pages, step=1, value=1)
    start_user = (current_page - 1) * page_lim
    end_user = start_user + page_lim
    result_df = users_df.iloc[start_user:end_user]

for _, row in result_df.iterrows():
    with st.expander(f"{row['first_name']} {row['last_name']} ({row['email']})", expanded=False):
        col1, col2 = st.columns([3, 1])
        
        with col1:
            new_role = st.selectbox(
                "Role", 
                ["student", "employer", "advisor", "admin"], 
                index=["student", "employer", "advisor", "admin"].index(row["role"]),
                key=f"role_{row['id']}"
            )

            new_status = st.selectbox(
                "Status", 
                ["active", "inactive", "pending", "suspended"], 
                index=["active", "inactive", "pending", "suspended"].index(row["status"]),
                key=f"status_{row['id']}"
            )

            if st.button("💾 Save Changes", key=f"save_{row['id']}"):
                res = requests.put(f"http://api:4000/u/users/{row['id']}", json={
                    "first_name": row["first_name"],
                    "last_name": row["last_name"],
                    "email": row["email"],
                    "role": new_role,
                    "status": new_status
                })
                if res.status_code == 200:
                    st.success("User updated successfully!")
                    st.rerun()
                else:
                    st.error("Failed to update user.")

        with col2:
            if st.button("🗑 Delete User", key=f"delete_{row['id']}"):
                res = requests.delete(f"http://api:4000/u/users/{row['id']}")
                if res.status_code == 200:
                    st.success("User deleted successfully!")
                    st.rerun()
                else:
                    st.error("Failed to delete user.")

    
#role breakdown chart
st.subheader("📊 User Role Breakdown")

res = requests.get("http://api:4000/u/users/summary")

if res.status_code == 200:
    role_data = pd.DataFrame(res.json())
    fig, ax = plt.subplots()
    ax.pie(role_data['count'], labels=role_data['role'], autopct='%1.1f%%', startangle=90)
    ax.axis('equal')  
    st.pyplot(fig)
else:
    st.error(f"Failed to fetch role breakdown. Status code: {res.status_code}")

#find users innactive for 6ht months 

st.subheader("🛑 Inactive Users (No activity in 6+ months)")

res = requests.get("http://api:4000/u/users/inactive")

if res.status_code == 200:
    inactive_df = pd.DataFrame(res.json())
    if not inactive_df.empty:
        st.dataframe(inactive_df)
    else:
        st.info("No inactive users found.")
else:
    st.error(f"Failed to fetch inactive users. Status code: {res.status_code}")
