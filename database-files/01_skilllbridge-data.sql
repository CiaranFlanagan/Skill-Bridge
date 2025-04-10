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
(8, 'BuildRight LLC'),
(27, 'SoftSkills Inc.'),
(28, 'TechTrail Corp.'),
(29, 'CreativeHub'),
(30, 'CloudStart Inc.'),
(31, 'NextGen Robotics'),
(32, 'VisionWorks'),
(33, 'DataWave LLC');


-- Insert job postings (employer_id refers to employers.user_id)
INSERT INTO job_postings (employer_id, title, status, posted_date) VALUES
(6, 'Software Engineer Intern', 'open', '2025-04-01 09:00:00'),
(7, 'Business Analyst Intern', 'open', '2025-03-25 10:30:00'),
(8, 'Mechanical Design Intern', 'closed', '2025-03-15 14:00:00'),
(27, 'Marketing Intern', 'open', '2025-03-20 12:00:00'),
(28, 'Frontend Developer Intern', 'open', '2025-03-21 09:30:00'),
(29, 'UI/UX Designer Intern', 'open', '2025-03-22 10:00:00'),
(30, 'Cloud Engineering Intern', 'open', '2025-03-23 11:00:00'),
(31, 'Robotics Intern', 'open', '2025-03-24 15:00:00'),
(32, 'Data Analyst Intern', 'open', '2025-03-28 13:30:00'),
(33, 'AI Research Intern', 'open', '2025-03-30 14:30:00'),
(6, 'Backend Developer Intern', 'open', '2025-03-10 11:00:00'),
(7, 'Strategy Intern', 'closed', '2025-03-14 09:00:00'),
(8, 'CAD Engineer Intern', 'open', '2025-03-11 10:15:00'),
(27, 'HR Assistant Intern', 'open', '2025-03-13 12:00:00'),
(28, 'Mobile App Developer Intern', 'open', '2025-03-16 09:45:00'),
(29, 'Visual Designer Intern', 'open', '2025-03-17 10:20:00'),
(30, 'DevOps Intern', 'open', '2025-03-18 14:10:00'),
(31, 'Embedded Systems Intern', 'open', '2025-03-19 11:30:00'),
(32, 'BI Analyst Intern', 'open', '2025-03-26 14:45:00'),
(33, 'Natural Language Intern', 'open', '2025-03-27 13:20:00'),
(6, 'Security Analyst Intern', 'open', '2025-03-09 08:50:00'),
(7, 'Market Research Intern', 'open', '2025-03-08 11:25:00'),
(8, 'Product Engineer Intern', 'open', '2025-03-07 14:00:00'),
(27, 'Recruiting Intern', 'open', '2025-03-06 10:40:00'),
(28, 'IT Support Intern', 'open', '2025-03-05 15:30:00'),
(29, 'Graphic Design Intern', 'open', '2025-03-04 12:10:00'),
(30, 'Platform Engineer Intern', 'open', '2025-03-03 16:00:00'),
(31, 'Testing Intern', 'open', '2025-03-02 10:15:00'),
(32, 'Operations Intern', 'open', '2025-03-01 13:00:00'),
(33, 'Content Strategist Intern', 'open', '2025-02-28 09:10:00');


-- Insert students (user_id is primary key)
INSERT INTO students (user_id, major_id, grad_date, current_year, gpa, alumni) VALUES
(1, 1, 2026, 2, 3.75, FALSE),
(2, 2, 2025, 3, 3.60, FALSE),
(9, 1, 2026, 2, 3.80, FALSE),
(10, 2, 2025, 3, 3.50, FALSE),
(11, 3, 2027, 1, 3.90, FALSE),
(12, 1, 2026, 2, 3.70, FALSE),
(13, 2, 2025, 3, 3.40, FALSE),
(14, 3, 2026, 2, 3.65, FALSE),
(15, 1, 2027, 1, 3.95, FALSE),
(16, 2, 2025, 3, 3.55, FALSE),
(17, 3, 2026, 2, 3.68, FALSE),
(18, 1, 2026, 2, 3.85, FALSE),
(19, 2, 2025, 3, 3.45, FALSE),
(20, 3, 2026, 2, 3.60, FALSE),
(31, 1, 2027, 1, 3.50, FALSE),
(32, 2, 2026, 2, 3.75, FALSE),
(33, 3, 2025, 3, 3.30, FALSE),
(34, 1, 2027, 1, 3.92, FALSE),
(35, 2, 2026, 2, 3.78, FALSE),
(36, 3, 2025, 3, 3.35, FALSE),
(37, 1, 2026, 2, 3.88, FALSE),
(38, 2, 2025, 3, 3.42, FALSE),
(39, 3, 2027, 1, 3.96, FALSE),
(40, 1, 2026, 2, 3.60, FALSE),
(21, 2, 2025, 3, 3.70, FALSE),
(22, 1, 2026, 2, 3.80, FALSE),
(23, 3, 2025, 3, 3.33, FALSE),
(24, 2, 2026, 2, 3.78, FALSE),
(25, 1, 2025, 3, 3.69, FALSE),
(26, 3, 2027, 1, 3.85, FALSE);


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
