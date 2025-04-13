DROP DATABASE IF EXISTS SkillBridge;

CREATE DATABASE IF NOT EXISTS SkillBridge;

USE SkillBridge;

CREATE TABLE users
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    email      VARCHAR(100) UNIQUE NOT NULL,
    status     VARCHAR(40),
    role       VARCHAR(15)
);

CREATE TABLE majors
(
    id   SMALLINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE skills
(
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE
);


CREATE TABLE employers
(
    user_id      INT PRIMARY KEY,
    company_name VARCHAR(50),

    CONSTRAINT fk_employers_user
        FOREIGN KEY (user_id) REFERENCES users(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE job_postings
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    employer_id INT NOT NULL,
    title       VARCHAR(400),
    status      VARCHAR(40),
    flagged     BOOLEAN DEFAULT FALSE,
    posted_date DATETIME,

    KEY idx_fk_employer_id (employer_id),
    CONSTRAINT fk_job_postings_employer FOREIGN KEY (employer_id) REFERENCES employers (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE students
(
    user_id      INT PRIMARY KEY,
    major_id     SMALLINT NOT NULL,
    grad_date    SMALLINT NOT NULL,
    current_year SMALLINT NOT NULL,
    gpa          FLOAT,
    alumni       BOOLEAN,

    KEY idx_fk_major_id (major_id),
    KEY idx_fk_user_id (user_id),
    CONSTRAINT fk_students_major
        FOREIGN KEY (major_id) REFERENCES majors (id)
            ON DELETE RESTRICT
            ON UPDATE CASCADE,
    CONSTRAINT fk_students_user
        FOREIGN KEY (user_id) REFERENCES users (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE advisors
(
    user_id         INT PRIMARY KEY,
    department VARCHAR(50) NOT NULL,

    KEY idx_fk_user_id (user_id),
    CONSTRAINT fk_advisors_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE advisor_students
(
    advisor_id INT NOT NULL,
    student_id INT NOT NULL,
    PRIMARY KEY (advisor_id, student_id),
    CONSTRAINT fk_advisor_students_advisor
        FOREIGN KEY (advisor_id) REFERENCES advisors(user_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_advisor_students_student
        FOREIGN KEY (student_id) REFERENCES students(user_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE   
);

CREATE TABLE resumes
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    resume     BLOB NOT NULL,

    KEY idx_fk_student_id (student_id),
    CONSTRAINT fk_resumes_student
        FOREIGN KEY (student_id) REFERENCES students (user_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE resume_feedback
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    advisor_id  INT      NOT NULL,
    resume_id   INT      NOT NULL,
    upload_date DATETIME NOT NULL,
    score       FLOAT    NOT NULL,
    feedback    VARCHAR(255),

    KEY idx_fk_advisor_id (advisor_id),
    KEY idx_fk_resume_id (resume_id),
    CONSTRAINT fk_resume_feedback_advisor
        FOREIGN KEY (advisor_id) REFERENCES advisors (user_id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_resume_feedback_resume
        FOREIGN KEY (resume_id) REFERENCES resumes (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);


CREATE TABLE student_skills
(
    student_id INT NOT NULL,
    skill_id   INT NOT NULL,
    PRIMARY KEY (student_id, skill_id),

    CONSTRAINT fk_student_skills_student
        FOREIGN KEY (student_id) REFERENCES students (user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_student_skills_skill
        FOREIGN KEY (skill_id) REFERENCES skills (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE job_posting_skills
(
    job_id   INT NOT NULL,
    skill_id INT NOT NULL,
    PRIMARY KEY (job_id, skill_id),

    CONSTRAINT fk_job_posting_skills_job
        FOREIGN KEY (job_id) REFERENCES job_postings (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_job_posting_skills_skill
        FOREIGN KEY (skill_id) REFERENCES skills (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE applications
(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    student_id   INT  NOT NULL,
    job_id       INT  NOT NULL,
    date_applied DATE NOT NULL,
    status       VARCHAR(40),

    KEY idx_fk_student_id (student_id),
    KEY idx_fk_job_id (job_id),
    CONSTRAINT fk_applications_student FOREIGN KEY (student_id) REFERENCES students (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_applications_job FOREIGN KEY (job_id) REFERENCES job_postings (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE issue_reports
(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    user_id      INT NOT NULL,
    date_created DATETIME,
    type         VARCHAR(50) NOT NULL,
    status       VARCHAR(40),
    description  VARCHAR(255),

    KEY idx_fk_user_id (user_id),
    CONSTRAINT fk_issue_reports_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE admins
(
    user_id INT PRIMARY KEY,

    KEY idx_fk_user_id (user_id),
    CONSTRAINT fk_admins_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- DROP DATABASE SkillBridge

