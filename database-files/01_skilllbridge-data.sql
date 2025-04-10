USE SkillBridge;

-- Insert sample majors
INSERT INTO majors (name) VALUES
                              ('Computer Science'),
                              ('Business Administration'),
                              ('Mechanical Engineering')
                              ('Biology'),
                              ('Chemistry'),
                              ('Physics'),
('Mathematics'),
('Psychology'),
('Sociology'),
('Economics'),
('Political Science'),
('English'),
('History'),
('Philosophy'),
('Anthropology'),
('Environmental Science'),
('Engineering'),
('Biomedical Engineering'),
('Electrical Engineering'),
('Civil Engineering'),
('Marketing'),
('Finance'),
('Accounting'),
('Nursing'),
('Public Health'),
('Education'),
('Art History'),
('Theater'),
('Journalism'),
('Neuroscience');

-- Insert sample skills
INSERT INTO skills (name) VALUES
                              ('Python'),
                              ('Java'),
                              ('SQL'),
                              ('Communication'),
                              ('Teamwork');

-- Insert sample users (students, advisors, admins, employers)
INSERT INTO users (first_name, last_name, email, status, role) VALUES
    ('Alice', 'Johnson', 'alice.johnson@example.com', 'active', 'student'),       -- id = 1
    ('Bob', 'Smith', 'bob.smith@example.com', 'active', 'student'),               -- id = 2
    ('Carol', 'Williams', 'carol.williams@example.com', 'active', 'advisor'),     -- id = 3
    ('David', 'Lee', 'david.lee@example.com', 'active', 'advisor'),               -- id = 4
    ('Eve', 'Nguyen', 'eve.nguyen@example.com', 'active', 'admin'),               -- id = 5
    ('Frank', 'Taylor', 'frank.taylor@techsolutions.com', 'active', 'employer'),  -- id = 6
    ('Grace', 'Kim', 'grace.kim@innovatecorp.com', 'active', 'employer'),         -- id = 7
    ('Henry', 'Adams', 'henry.adams@buildright.com', 'active', 'employer'),       -- id = 8
    ('Ivy', 'Brooks', 'ivy.brooks@example.com', 'active', 'student'),             -- id = 9
    ('Jack', 'Murphy', 'jack.murphy@example.com', 'active', 'student'),           -- id = 10
    ('Kara', 'Danvers', 'kara.danvers@example.com', 'active', 'student'),         -- id = 11
    ('Leo', 'Grant', 'leo.grant@example.com', 'active', 'student'),               -- id = 12
    ('Mia', 'Hernandez', 'mia.hernandez@example.com', 'active', 'student'),       -- id = 13
    ('Nathan', 'Scott', 'nathan.scott@example.com', 'active', 'student'),         -- id = 14
    ('Olivia', 'Parker', 'olivia.parker@example.com', 'active', 'student'),       -- id = 15
    ('Paul', 'Reed', 'paul.reed@example.com', 'active', 'student'),               -- id = 16
    ('Quinn', 'Stewart', 'quinn.stewart@example.com', 'active', 'student'),       -- id = 17
    ('Rachel', 'Cruz', 'rachel.cruz@example.com', 'active', 'student'),           -- id = 18
    ('Sam', 'Walker', 'sam.walker@example.com', 'active', 'student'),             -- id = 19
    ('Tina', 'Lewis', 'tina.lewis@example.com', 'active', 'student'),             -- id = 20
    ('Uma', 'Patel', 'uma.patel@example.com', 'active', 'advisor'),               -- id = 21
    ('Victor', 'Nguyen', 'victor.nguyen@example.com', 'active', 'advisor'),       -- id = 22
    ('Wendy', 'Chen', 'wendy.chen@example.com', 'active', 'advisor'),             -- id = 23
    ('Xavier', 'Lopez', 'xavier.lopez@example.com', 'active', 'advisor'),         -- id = 24
    ('Yara', 'Moore', 'yara.moore@example.com', 'active', 'admin'),               -- id = 25
    ('Zane', 'Carter', 'zane.carter@example.com', 'active', 'admin'),             -- id = 26
    ('Amy', 'Jordan', 'amy.jordan@softskills.io', 'active', 'employer'),          -- id = 27
    ('Ben', 'Thomas', 'ben.thomas@techtrail.com', 'active', 'employer'),          -- id = 28
    ('Clara', 'Ng', 'clara.ng@creativehub.org', 'active', 'employer'),            -- id = 29
    ('Dylan', 'Foster', 'dylan.foster@cloudstart.com', 'active', 'employer'),     -- id = 30
    ('Elena', 'Stone', 'elena.stone@example.com', 'active', 'student'),           -- id = 31
    ('Finn', 'Cooper', 'finn.cooper@example.com', 'active', 'student'),           -- id = 32
    ('Gina', 'Turner', 'gina.turner@example.com', 'active', 'student'),           -- id = 33
    ('Hank', 'Wells', 'hank.wells@example.com', 'active', 'student'),             -- id = 34
    ('Isla', 'Morgan', 'isla.morgan@example.com', 'active', 'student'),           -- id = 35
    ('Jon', 'Bennett', 'jon.bennett@example.com', 'active', 'student'),           -- id = 36
    ('Kate', 'Ramos', 'kate.ramos@example.com', 'active', 'student'),             -- id = 37
    ('Liam', 'Hayes', 'liam.hayes@example.com', 'active', 'student'),             -- id = 38
    ('Maya', 'Evans', 'maya.evans@example.com', 'active', 'student'),             -- id = 39
    ('Noah', 'Reyes', 'noah.reyes@example.com', 'active', 'student');             -- id = 40


-- Insert employers (use user_id from users)
INSERT INTO employers (user_id, company_name) VALUES
                                                  (6, 'Tech Solutions Inc.'),
                                                  (7, 'Innovate Corp.'),
                                                  (8, 'BuildRight LLC');

-- Insert job postings (employer_id refers to employers.user_id)
INSERT INTO job_postings (employer_id, title, status, posted_date) VALUES
                                                                       (6, 'Software Engineer Intern', 'open', '2025-04-01 09:00:00'),
                                                                       (7, 'Business Analyst Intern', 'open', '2025-03-25 10:30:00'),
                                                                       (8, 'Mechanical Design Intern', 'closed', '2025-03-15 14:00:00');

-- Insert students (user_id is primary key)
INSERT INTO students (user_id, major_id, grad_date, current_year, gpa, alumni) VALUES
                                                                                   (1, 1, 2026, 2, 3.75, FALSE),
                                                                                   (2, 2, 2025, 3, 3.60, FALSE);

-- Insert advisors (user_id is primary key)
INSERT INTO advisors (user_id, department) VALUES
                                               (3, 'Computer Science'),
                                               (4, 'Business');

-- Link advisors to students using the join table
INSERT INTO advisor_students (advisor_id, student_id) VALUES
                                                          (3, 1), -- Carol advises Alice
                                                          (4, 2); -- David advises Bob

-- Insert resumes with mock binary data
INSERT INTO resumes (student_id, resume) VALUES
                                             (1, 0x255044462D4D4F434B2D415C), -- '%PDF-MOCK-A\'
                                             (2, 0x255044462D4D4F434B2D425C); -- '%PDF-MOCK-B\'

-- Insert resume feedback
INSERT INTO resume_feedback (advisor_id, resume_id, upload_date, score, feedback) VALUES
                                                                                      (3, 1, '2025-04-01 10:00:00', 4.5, 'Great formatting and strong experience.'),
                                                                                      (4, 2, '2025-04-01 11:00:00', 3.8, 'Needs improvement in summary section.');

-- Insert student skills
INSERT INTO student_skills (student_id, skill_id) VALUES
                                                      (1, 1),
                                                      (1, 3),
                                                      (1, 4),
                                                      (2, 4),
                                                      (2, 5);

-- Insert job posting skills
INSERT INTO job_posting_skills (job_id, skill_id) VALUES
                                                      (1, 1),
                                                      (1, 2),
                                                      (2, 4),
                                                      (2, 5),
                                                      (3, 3);

-- Insert applications
INSERT INTO applications (student_id, job_id, date_applied, status) VALUES
                                                                        (1, 1, '2025-04-01', 'pending'),
                                                                        (2, 2, '2025-03-27', 'accepted');

-- Insert issue reports
INSERT INTO issue_reports (user_id, date_created, type, status, description) VALUES
                                                                                 (1, '2025-04-01 12:00:00', 'Login Issue', 'open', 'Cannot log in to portal.'),
                                                                                 (2, '2025-04-01 13:00:00', 'Resume Upload', 'resolved', 'Upload fails for PDF file.');

-- Insert admin
INSERT INTO admins (user_id) VALUES
    (5);
