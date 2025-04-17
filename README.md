# SkillBridge 

SkillBridge is a full-stack platform designed to connect students, advisors, and employers through a centralized system for job postings, applications, resume feedback, and issue reporting.

This project uses:
- **Python Flask** for the REST API
- **MySQL** for the database
- **Streamlit** for the frontend UI
- **Docker Compose** to orchestrate services

---

## How to Set Up and Run the Project

### 1. Clone the repository
```bash
git clone https://github.com/CiaranFlanagan/Skill-Bridge.git
cd Skill-Bridge
```
---

### 2. Create a `.env` file
Inside the root directory, create a `.env` file with the following environment variables:

```plaintext
SECRET_KEY=someCrazyS3cR3T!Key.!
DB_USER=root
DB_HOST=db
DB_PORT=3306
DB_NAME=SkillBridge
MYSQL_ROOT_PASSWORD=ciaran33!
```

---

### 3. Start all services with Docker Compose
Make sure Docker is running, then run:

```bash
docker compose up -d
```

This will:
- Build and start the **MySQL database** container
- Build and start the **Flask API** container
- Build and start the **Streamlit frontend** container

---

### 4. Verify Setup

- **MySQL Database**: Running on internal network
- **Flask REST API**: Accessible at `http://localhost:4000`
- **Streamlit Frontend**: Accessible at `http://localhost:8501`

---

## Key Features

- Students can:
  - View personalized job dashboards
  - Upload resumes and receive advisor feedback
  - Track the status of their applications

- Advisors can:
  - Review and provide feedback on student resumes
  - Manage students and employers

- Employers can:
  - Post job and co-op listings
  - Track applications from students

- Admins can:
  - Manage users
  - Manage job postings
  - Review and resolve issue reports

---

## Team Members
- **Ciaran Flanagan**
- **Rithik Raghuraman**
- **Anjali Deo**
- **Charles Youtt**
- **Vicente Santos**


---

## 📄 Notes
- Be sure to update your `.env` file correctly before starting.
- Use `docker compose down` to stop all services when finished.
- If you make changes to the database, rebuild containers using:
```bash
docker compose down
docker compose up --build -d
```

---
