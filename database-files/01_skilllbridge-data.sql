USE SkillBridge;

-- Insert sample majors
INSERT INTO majors (name) VALUES
('Computer Science'),
('Business Administration'),
('Electrical Engineering'),
('Psychology'),
('Mechanical Engineering'),
('Biology'),
('Economics'),
('Chemistry'),
('Mathematics'),
('Communications'),
('Political Science'),
('Nursing'),
('English Literature'),
('Physics'),
('Marketing'),
('History'),
('Sociology'),
('Civil Engineering'),
('Finance'),
('Graphic Design'),
('Architecture'),
('Anthropology'),
('Philosophy'),
('Music'),
('International Relations'),
('Environmental Science'),
('Accounting'),
('Criminal Justice'),
('Data Science'),
('Journalism'),
('Education'),
('Biochemistry'),
('Art History'),
('Computer Engineering'),
('Information Technology'),
('Human Resources'),
('Linguistics'),
('Geography'),
('Public Health'),
('Aerospace Engineering');

-- Insert sample skills
INSERT INTO skills (name) VALUES
('Java Programming'),
('Project Management'),
('Data Analysis'),
('JavaScript'),
('Public Speaking'),
('Problem Solving'),
('Team Leadership'),
('SQL'),
('Python'),
('Critical Thinking'),
('Customer Service'),
('Microsoft Office'),
('Adobe Photoshop'),
('Content Writing'),
('Digital Marketing'),
('Machine Learning'),
('Financial Analysis'),
('HTML/CSS'),
('Agile Methodology'),
('Research'),
('Communication'),
('C++'),
('Accounting'),
('UX Design'),
('Network Security'),
('Social Media Management'),
('Database Administration'),
('Quality Assurance'),
('React'),
('Business Strategy'),
('Technical Writing'),
('Product Development'),
('Statistical Analysis'),
('Mobile Development'),
('Sales'),
('UI Design'),
('Cloud Computing'),
('SEO'),
('Video Editing'),
('Node.js');

-- Insert sample users (students, advisors, admins, employers)
INSERT INTO users (first_name, last_name, email, status, role) VALUES
-- Employers (40 users, IDs 1-40)
('John', 'Doe', 'john.doe@example.com', 'active', 'employer'),
('Jane', 'Smith', 'jane.smith@example.com', 'active', 'employer'),
('Michael', 'Johnson', 'michael.johnson@example.com', 'inactive', 'employer'),
('Emily', 'Williams', 'emily.williams@example.com', 'active', 'employer'),
('David', 'Brown', 'david.brown@example.com', 'pending', 'employer'),
('Sarah', 'Jones', 'sarah.jones@example.com', 'active', 'employer'),
('Robert', 'Garcia', 'robert.garcia@example.com', 'active', 'employer'),
('Jennifer', 'Miller', 'jennifer.miller@example.com', 'suspended', 'employer'),
('William', 'Davis', 'william.davis@example.com', 'active', 'employer'),
('Elizabeth', 'Rodriguez', 'elizabeth.rodriguez@example.com', 'active', 'employer'),
('James', 'Martinez', 'james.martinez@example.com', 'inactive', 'employer'),
('Patricia', 'Hernandez', 'patricia.hernandez@example.com', 'active', 'employer'),
('Richard', 'Lopez', 'richard.lopez@example.com', 'pending', 'employer'),
('Linda', 'Gonzalez', 'linda.gonzalez@example.com', 'active', 'employer'),
('Thomas', 'Wilson', 'thomas.wilson@example.com', 'active', 'employer'),
('Barbara', 'Anderson', 'barbara.anderson@example.com', 'suspended', 'employer'),
('Charles', 'Thomas', 'charles.thomas@example.com', 'active', 'employer'),
('Susan', 'Taylor', 'susan.taylor@example.com', 'active', 'employer'),
('Joseph', 'Moore', 'joseph.moore@example.com', 'inactive', 'employer'),
('Margaret', 'Jackson', 'margaret.jackson@example.com', 'active', 'employer'),
('Daniel', 'White', 'daniel.white@example.com', 'active', 'employer'),
('Nancy', 'Harris', 'nancy.harris@example.com', 'pending', 'employer'),
('Paul', 'Clark', 'paul.clark@example.com', 'active', 'employer'),
('Karen', 'Lewis', 'karen.lewis@example.com', 'active', 'employer'),
('Mark', 'Robinson', 'mark.robinson@example.com', 'inactive', 'employer'),
('Lisa', 'Walker', 'lisa.walker@example.com', 'active', 'employer'),
('Christopher', 'Perez', 'christopher.perez@example.com', 'active', 'employer'),
('Michelle', 'Hall', 'michelle.hall@example.com', 'suspended', 'employer'),
('Kenneth', 'Young', 'kenneth.young@example.com', 'active', 'employer'),
('Donna', 'Allen', 'donna.allen@example.com', 'active', 'employer'),
('Edward', 'Sanchez', 'edward.sanchez@example.com', 'inactive', 'employer'),
('Carol', 'Wright', 'carol.wright@example.com', 'active', 'employer'),
('Steven', 'King', 'steven.king@example.com', 'pending', 'employer'),
('Helen', 'Scott', 'helen.scott@example.com', 'active', 'employer'),
('George', 'Green', 'george.green@example.com', 'active', 'employer'),
('Sandra', 'Adams', 'sandra.adams@example.com', 'suspended', 'employer'),
('Ronald', 'Baker', 'ronald.baker@example.com', 'active', 'employer'),
('Sharon', 'Gonzales', 'sharon.gonzales@example.com', 'active', 'employer'),
('Timothy', 'Nelson', 'timothy.nelson@example.com', 'inactive', 'employer'),
('Deborah', 'Carter', 'deborah.carter@example.com', 'active', 'employer'),

-- Students (40 users, IDs 41-80)
('Alex', 'Johnson', 'alex.johnson@example.com', 'active', 'student'),
('Emma', 'Wilson', 'emma.wilson@example.com', 'active', 'student'),
('Ryan', 'Smith', 'ryan.smith@example.com', 'active', 'student'),
('Olivia', 'Brown', 'olivia.brown@example.com', 'active', 'student'),
('Tyler', 'Davis', 'tyler.davis@example.com', 'active', 'student'),
('Sophia', 'Miller', 'sophia.miller@example.com', 'active', 'student'),
('Nathan', 'Anderson', 'nathan.anderson@example.com', 'active', 'student'),
('Isabella', 'Thomas', 'isabella.thomas@example.com', 'active', 'student'),
('Ethan', 'Jackson', 'ethan.jackson@example.com', 'inactive', 'student'),
('Ava', 'White', 'ava.white@example.com', 'active', 'student'),
('Jacob', 'Harris', 'jacob.harris@example.com', 'active', 'student'),
('Mia', 'Martin', 'mia.martin@example.com', 'active', 'student'),
('Noah', 'Thompson', 'noah.thompson@example.com', 'active', 'student'),
('Charlotte', 'Garcia', 'charlotte.garcia@example.com', 'active', 'student'),
('Liam', 'Martinez', 'liam.martinez@example.com', 'active', 'student'),
('Amelia', 'Robinson', 'amelia.robinson@example.com', 'active', 'student'),
('Benjamin', 'Clark', 'benjamin.clark@example.com', 'pending', 'student'),
('Harper', 'Rodriguez', 'harper.rodriguez@example.com', 'active', 'student'),
('Mason', 'Lewis', 'mason.lewis@example.com', 'active', 'student'),
('Evelyn', 'Lee', 'evelyn.lee@example.com', 'active', 'student'),
('Elijah', 'Walker', 'elijah.walker@example.com', 'active', 'student'),
('Abigail', 'Hall', 'abigail.hall@example.com', 'active', 'student'),
('Logan', 'Allen', 'logan.allen@example.com', 'active', 'student'),
('Emily', 'Young', 'emily.young@example.com', 'active', 'student'),
('Lucas', 'Hernandez', 'lucas.hernandez@example.com', 'active', 'student'),
('Elizabeth', 'King', 'elizabeth.king@example.com', 'active', 'student'),
('Daniel', 'Wright', 'daniel.wright@example.com', 'suspended', 'student'),
('Avery', 'Lopez', 'avery.lopez@example.com', 'active', 'student'),
('Henry', 'Hill', 'henry.hill@example.com', 'active', 'student'),
('Sofia', 'Green', 'sofia.green@example.com', 'active', 'student'),
('Carter', 'Adams', 'carter.adams@example.com', 'active', 'student'),
('Scarlett', 'Baker', 'scarlett.baker@example.com', 'active', 'student'),
('Owen', 'Gonzalez', 'owen.gonzalez@example.com', 'active', 'student'),
('Madison', 'Nelson', 'madison.nelson@example.com', 'active', 'student'),
('Wyatt', 'Carter', 'wyatt.carter@example.com', 'active', 'student'),
('Chloe', 'Mitchell', 'chloe.mitchell@example.com', 'active', 'student'),
('Jack', 'Perez', 'jack.perez@example.com', 'active', 'student'),
('Lily', 'Roberts', 'lily.roberts@example.com', 'active', 'student'),
('Gabriel', 'Turner', 'gabriel.turner@example.com', 'pending', 'student'),
('Grace', 'Phillips', 'grace.phillips@example.com', 'active', 'student'),

-- Advisors (40 users, IDs 81-120)
('Robert', 'Williams', 'robert.williams@example.com', 'active', 'advisor'),
('Mary', 'Johnson', 'mary.johnson@example.com', 'active', 'advisor'),
('Christopher', 'Smith', 'christopher.smith@example.com', 'active', 'advisor'),
('Jennifer', 'Brown', 'jennifer.brown@example.com', 'active', 'advisor'),
('Michael', 'Jones', 'michael.jones@example.com', 'active', 'advisor'),
('Laura', 'Davis', 'laura.davis@example.com', 'active', 'advisor'),
('James', 'Miller', 'james.miller@example.com', 'active', 'advisor'),
('Patricia', 'Wilson', 'patricia.wilson@example.com', 'active', 'advisor'),
('Richard', 'Moore', 'richard.moore@example.com', 'active', 'advisor'),
('Linda', 'Taylor', 'linda.taylor@example.com', 'active', 'advisor'),
('Thomas', 'Anderson', 'thomas.anderson@example.com', 'active', 'advisor'),
('Elizabeth', 'Thomas', 'elizabeth.thomas@example.com', 'active', 'advisor'),
('William', 'Jackson', 'william.jackson@example.com', 'active', 'advisor'),
('Susan', 'White', 'susan.white@example.com', 'active', 'advisor'),
('Joseph', 'Harris', 'joseph.harris@example.com', 'active', 'advisor'),
('Margaret', 'Martin', 'margaret.martin@example.com', 'active', 'advisor'),
('Charles', 'Thompson', 'charles.thompson@example.com', 'active', 'advisor'),
('Jessica', 'Garcia', 'jessica.garcia@example.com', 'active', 'advisor'),
('Daniel', 'Martinez', 'daniel.martinez@example.com', 'active', 'advisor'),
('Nancy', 'Robinson', 'nancy.robinson@example.com', 'active', 'advisor'),
('Matthew', 'Lewis', 'matthew.lewis@example.com', 'active', 'advisor'),
('Dorothy', 'Lee', 'dorothy.lee@example.com', 'active', 'advisor'),
('Anthony', 'Walker', 'anthony.walker@example.com', 'active', 'advisor'),
('Lisa', 'Hall', 'lisa.hall@example.com', 'active', 'advisor'),
('Donald', 'Allen', 'donald.allen@example.com', 'active', 'advisor'),
('Kimberly', 'Young', 'kimberly.young@example.com', 'active', 'advisor'),
('Paul', 'Hernandez', 'paul.hernandez@example.com', 'active', 'advisor'),
('Betty', 'King', 'betty.king@example.com', 'active', 'advisor'),
('Andrew', 'Wright', 'andrew.wright@example.com', 'active', 'advisor'),
('Melissa', 'Lopez', 'melissa.lopez@example.com', 'active', 'advisor'),
('Joshua', 'Hill', 'joshua.hill@example.com', 'active', 'advisor'),
('Deborah', 'Green', 'deborah.green@example.com', 'active', 'advisor'),
('Kevin', 'Adams', 'kevin.adams@example.com', 'active', 'advisor'),
('Amanda', 'Baker', 'amanda.baker@example.com', 'active', 'advisor'),
('Brian', 'Gonzalez', 'brian.gonzalez@example.com', 'active', 'advisor'),
('Stephanie', 'Nelson', 'stephanie.nelson@example.com', 'active', 'advisor'),
('George', 'Carter', 'george.carter@example.com', 'active', 'advisor'),
('Rebecca', 'Mitchell', 'rebecca.mitchell@example.com', 'active', 'advisor'),
('Edward', 'Perez', 'edward.perez@example.com', 'active', 'advisor'),
('Sharon', 'Roberts', 'sharon.roberts@example.com', 'active', 'advisor'),

-- Admins (40 users, IDs 121-160)
('Sarah', 'Clark', 'sarah.clark@example.com', 'active', 'admin'),
('Mark', 'Rodriguez', 'mark.rodriguez@example.com', 'active', 'admin'),
('Karen', 'Lewis2', 'karen.lewis2@example.com', 'active', 'admin'),
('David', 'Lee', 'david.lee@example.com', 'active', 'admin'),
('Lisa', 'Walker2', 'lisa.walker2@example.com', 'active', 'admin'),
('John', 'Hall', 'john.hall@example.com', 'active', 'admin'),
('Michelle', 'Allen', 'michelle.allen@example.com', 'active', 'admin'),
('Paul', 'Young', 'paul.young@example.com', 'active', 'admin'),
('Donna', 'Hernandez', 'donna.hernandez@example.com', 'active', 'admin'),
('Steven', 'King2', 'steven.king2@example.com', 'active', 'admin'),
('Carol', 'Wright2', 'carol.wright2@example.com', 'active', 'admin'),
('Kenneth', 'Lopez', 'kenneth.lopez@example.com', 'active', 'admin'),
('Helen', 'Hill', 'helen.hill@example.com', 'active', 'admin'),
('Edward', 'Green', 'edward.green@example.com', 'active', 'admin'),
('Sandra', 'Adams2', 'sandra.adams2@example.com', 'active', 'admin'),
('George', 'Baker', 'george.baker@example.com', 'active', 'admin'),
('Sharon', 'Gonzalez2', 'sharon.gonzalez2@example.com', 'active', 'admin'),
('Ronald', 'Nelson', 'ronald.nelson@example.com', 'active', 'admin'),
('Timothy', 'Carter', 'timothy.carter@example.com', 'active', 'admin'),
('Deborah', 'Mitchell', 'deborah.mitchell@example.com', 'active', 'admin'),
('Frank', 'Turner', 'frank.turner@example.com', 'active', 'admin'),
('Ruth', 'Phillips', 'ruth.phillips@example.com', 'active', 'admin'),
('Patrick', 'Campbell', 'patrick.campbell@example.com', 'active', 'admin'),
('Maria', 'Parker', 'maria.parker@example.com', 'active', 'admin'),
('Jerry', 'Evans', 'jerry.evans@example.com', 'active', 'admin'),
('Judith', 'Edwards', 'judith.edwards@example.com', 'active', 'admin'),
('Gregory', 'Collins', 'gregory.collins@example.com', 'active', 'admin'),
('Cynthia', 'Stewart', 'cynthia.stewart@example.com', 'active', 'admin'),
('Raymond', 'Sanchez', 'raymond.sanchez@example.com', 'active', 'admin'),
('Janice', 'Morris', 'janice.morris@example.com', 'active', 'admin'),
('Dennis', 'Rogers', 'dennis.rogers@example.com', 'active', 'admin'),
('Virginia', 'Reed', 'virginia.reed@example.com', 'active', 'admin'),
('Walter', 'Cook', 'walter.cook@example.com', 'active', 'admin'),
('Catherine', 'Morgan', 'catherine.morgan@example.com', 'active', 'admin'),
('Lawrence', 'Bell', 'lawrence.bell@example.com', 'active', 'admin'),
('Frances', 'Murphy', 'frances.murphy@example.com', 'active', 'admin'),
('Stephen', 'Bailey', 'stephen.bailey@example.com', 'active', 'admin'),
('Ann', 'Rivera', 'ann.rivera@example.com', 'active', 'admin'),
('Bruce', 'Cooper', 'bruce.cooper@example.com', 'active', 'admin'),
('Janet', 'Richardson', 'janet.richardson@example.com', 'active', 'admin');


-- Insert employers (use user_id from users)
INSERT INTO employers (user_id, company_name) VALUES
(1, 'Acme Corporation'),
(2, 'TechGlobal Inc.'),
(3, 'Summit Enterprises'),
(4, 'Infinite Solutions'),
(5, 'Apex Industries'),
(6, 'Stellar Systems'),
(7, 'Innovation Labs'),
(8, 'Horizon Group'),
(9, 'Pinnacle Technologies'),
(10, 'Elite Consulting'),
(11, 'Quantum Dynamics'),
(12, 'FusionTech'),
(13, 'Catalyst Research'),
(14, 'Momentum Partners'),
(15, 'Precision Engineering'),
(16, 'Nexus Networks'),
(17, 'Synergy Solutions'),
(18, 'Vertex Analytics'),
(19, 'Prism Media'),
(20, 'Atlas Corporation'),
(21, 'Elevate Ventures'),
(22, 'Spectrum Innovations'),
(23, 'Pulse Digital'),
(24, 'Matrix Systems'),
(25, 'Orbit Communications'),
(26, 'Vector Industries'),
(27, 'Phoenix Enterprises'),
(28, 'Sapphire Solutions'),
(29, 'Titan Technologies'),
(30, 'Helix Group'),
(31, 'Cascade Analytics'),
(32, 'Lumina Networks'),
(33, 'Centaur Systems'),
(34, 'Everest Consulting'),
(35, 'Enigma Software'),
(36, 'Meridian Technologies'),
(37, 'Eclipse Industries'),
(38, 'Polaris Engineering'),
(39, 'Vortex Solutions'),
(40, 'Zenith Corporation');


-- Insert job postings (employer_id refers to employers.user_id)
INSERT INTO job_postings (employer_id, title, status, flagged, posted_date) VALUES
(1, 'Senior Software Engineer', 'active', FALSE, '2025-03-15 09:30:00'),
(2, 'Marketing Manager', 'active', FALSE, '2025-03-10 14:45:00'),
(3, 'Data Analyst', 'active', FALSE, '2025-03-12 11:20:00'),
(4, 'Product Designer', 'active', FALSE, '2025-03-18 08:15:00'),
(5, 'Financial Advisor', 'active', FALSE, '2025-03-05 10:30:00'),
(6, 'Customer Support Specialist', 'active', FALSE, '2025-03-20 15:45:00'),
(7, 'Project Manager', 'active', FALSE, '2025-03-08 13:00:00'),
(8, 'Human Resources Coordinator', 'inactive', FALSE, '2025-02-28 09:15:00'),
(9, 'Full Stack Developer', 'active', FALSE, '2025-03-17 14:30:00'),
(10, 'Sales Representative', 'active', FALSE, '2025-03-14 11:45:00'),
(11, 'UX/UI Designer', 'active', FALSE, '2025-03-22 10:00:00'),
(12, 'Business Analyst', 'pending', FALSE, '2025-04-01 16:30:00'),
(13, 'Network Administrator', 'active', FALSE, '2025-03-25 08:45:00'),
(14, 'Content Writer', 'active', FALSE, '2025-03-19 13:15:00'),
(15, 'Quality Assurance Engineer', 'active', FALSE, '2025-03-16 11:30:00'),
(16, 'Graphic Designer', 'active', FALSE, '2025-03-24 09:45:00'),
(17, 'Operations Manager', 'active', FALSE, '2025-03-11 14:00:00'),
(18, 'Research Scientist', 'inactive', TRUE, '2025-02-25 16:15:00'),
(19, 'Social Media Coordinator', 'active', FALSE, '2025-03-21 10:30:00'),
(20, 'Front End Developer', 'active', FALSE, '2025-03-23 15:00:00'),
(21, 'Data Scientist', 'active', FALSE, '2025-03-28 08:30:00'),
(22, 'Account Manager', 'active', FALSE, '2025-03-27 13:45:00'),
(23, 'IT Support Specialist', 'active', FALSE, '2025-03-26 11:00:00'),
(24, 'Administrative Assistant', 'active', FALSE, '2025-03-30 09:15:00'),
(25, 'Back End Developer', 'pending', FALSE, '2025-04-02 14:30:00'),
(26, 'Product Manager', 'active', FALSE, '2025-03-29 10:45:00'),
(27, 'Customer Success Manager', 'active', FALSE, '2025-03-31 15:15:00'),
(28, 'Digital Marketing Specialist', 'active', FALSE, '2025-03-09 08:00:00'),
(29, 'Mobile App Developer', 'active', FALSE, '2025-03-13 13:30:00'),
(30, 'Technical Writer', 'inactive', FALSE, '2025-02-20 11:15:00'),
(31, 'Systems Analyst', 'active', FALSE, '2025-04-03 09:30:00'),
(32, 'Supply Chain Manager', 'active', FALSE, '2025-04-04 14:45:00'),
(33, 'Web Developer', 'active', FALSE, '2025-04-05 10:00:00'),
(34, 'DevOps Engineer', 'active', FALSE, '2025-04-06 15:30:00'),
(35, 'Accounting Clerk', 'active', FALSE, '2025-03-07 08:15:00'),
(36, 'Machine Learning Engineer', 'pending', TRUE, '2025-04-07 13:00:00'),
(37, 'Executive Assistant', 'active', FALSE, '2025-04-08 11:30:00'),
(38, 'Database Administrator', 'active', FALSE, '2025-04-09 09:45:00'),
(39, 'Software Developer Intern', 'active', FALSE, '2025-04-10 14:15:00'),
(40, 'Customer Experience Manager', 'active', FALSE, '2025-04-11 10:30:00');

-- Insert students (user_id is primary key)
INSERT INTO students (user_id, major_id, grad_date, current_year, gpa, alumni) VALUES
(41, 1, 2026, 2, 3.7, false),
(42, 2, 2025, 3, 3.9, false),
(43, 3, 2026, 2, 3.5, false),
(44, 4, 2027, 1, 3.8, false),
(45, 5, 2025, 3, 3.2, false),
(46, 6, 2025, 3, 3.9, false),
(47, 7, 2026, 2, 3.4, false),
(48, 8, 2027, 1, 3.6, false),
(49, 9, 2023, 4, 3.1, true),
(50, 10, 2026, 2, 3.8, false),
(51, 11, 2025, 3, 3.5, false),
(52, 12, 2027, 1, 3.7, false),
(53, 13, 2026, 2, 3.9, false),
(54, 14, 2025, 3, 3.4, false),
(55, 15, 2025, 3, 3.2, false),
(56, 16, 2026, 2, 3.8, false),
(57, 17, 2023, 4, 3.1, true),
(58, 18, 2025, 3, 3.7, false),
(59, 19, 2026, 2, 3.9, false),
(60, 20, 2027, 1, 3.5, false),
(61, 21, 2025, 3, 3.3, false),
(62, 22, 2026, 2, 3.6, false),
(63, 23, 2027, 1, 3.8, false),
(64, 24, 2023, 4, 3.4, true),
(65, 25, 2025, 3, 3.9, false),
(66, 26, 2026, 2, 3.7, false),
(67, 27, 2023, 4, 3.0, true),
(68, 28, 2025, 3, 3.5, false),
(69, 29, 2027, 1, 3.8, false),
(70, 30, 2026, 2, 3.4, false),
(71, 31, 2025, 3, 3.6, false),
(72, 32, 2027, 1, 3.9, false),
(73, 33, 2026, 2, 3.2, false),
(74, 34, 2025, 3, 3.7, false),
(75, 35, 2023, 4, 3.4, true),
(76, 36, 2026, 2, 3.8, false),
(77, 37, 2027, 1, 3.5, false),
(78, 38, 2025, 3, 3.9, false),
(79, 39, 2026, 2, 3.3, false),
(80, 40, 2027, 1, 3.7, false);


-- Insert advisors (user_id is primary key)
INSERT INTO advisors (user_id, department) VALUES
(81, 'Computer Science'),
(82, 'Business'),
(83, 'Engineering'),
(84, 'Psychology'),
(85, 'Mathematics'),
(86, 'Biology'),
(87, 'Economics'),
(88, 'Chemistry'),
(89, 'Physics'),
(90, 'Communications'),
(91, 'Political Science'),
(92, 'Nursing'),
(93, 'English'),
(94, 'Arts'),
(95, 'History'),
(96, 'Sociology'),
(97, 'International Studies'),
(98, 'Environmental Science'),
(99, 'Education'),
(100, 'Architecture'),
(101, 'Medicine'),
(102, 'Law'),
(103, 'Anthropology'),
(104, 'Philosophy'),
(105, 'Music'),
(106, 'Linguistics'),
(107, 'Geography'),
(108, 'Religious Studies'),
(109, 'Data Science'),
(110, 'Criminal Justice'),
(111, 'Journalism'),
(112, 'Public Health'),
(113, 'Marketing'),
(114, 'Finance'),
(115, 'Accounting'),
(116, 'Human Resources'),
(117, 'Information Technology'),
(118, 'Graphic Design'),
(119, 'Astronomy'),
(120, 'Public Policy');

-- Link advisors to students using the join table
INSERT INTO advisor_students (advisor_id, student_id) VALUES
-- Advisor 81 has 5 students
(81, 41),
(81, 42),
(81, 43),
(81, 44),
(81, 45),

-- Advisor 82 has 4 students
(82, 46),
(82, 47),
(82, 48),
(82, 49),

-- Advisor 83 has 3 students
(83, 50),
(83, 51),
(83, 52),

-- Advisor 84 has 4 students
(84, 53),
(84, 54),
(84, 55),
(84, 56),

-- Advisor 85 has 3 students
(85, 57),
(85, 58),
(85, 59),

-- Advisor 86 has 4 students
(86, 60),
(86, 61),
(86, 62),
(86, 63),

-- Advisor 87 has 3 students
(87, 64),
(87, 65),
(87, 66),

-- Advisor 88 has 4 students
(88, 67),
(88, 68),
(88, 69),
(88, 70),

-- Advisor 89 has 3 students
(89, 71),
(89, 72),
(89, 73),

-- Advisor 90 has 3 students
(90, 74),
(90, 75),
(90, 76),

-- Advisor 91 has 3 students
(91, 77),
(91, 78),
(91, 79),

-- Advisor 92 has 3 students
(92, 80),
(92, 41),
(92, 42),

-- Advisor 93 has 3 students
(93, 43),
(93, 44),
(93, 45),

-- Advisor 94 has 3 students
(94, 46),
(94, 47),
(94, 48),

-- Advisor 95 has 3 students
(95, 49),
(95, 50),
(95, 51),

-- Advisor 96 has 3 students
(96, 52),
(96, 53),
(96, 54),

-- Advisor 97 has 3 students
(97, 55),
(97, 56),
(97, 57),

-- Advisor 98 has 3 students
(98, 58),
(98, 59),
(98, 60),

-- Advisor 99 has 3 students
(99, 61),
(99, 62),
(99, 63),

-- Advisor 100 has 3 students
(100, 64),
(100, 65),
(100, 66),

-- Advisor 101 has 3 students
(101, 67),
(101, 68),
(101, 69),

-- Advisor 102 has 3 students
(102, 70),
(102, 71),
(102, 72),

-- Advisor 103 has 3 students
(103, 73),
(103, 74),
(103, 75),

-- Advisor 104 has 3 students
(104, 76),
(104, 77),
(104, 78),

-- Advisor 105 has 3 students
(105, 79),
(105, 80),
(105, 41),

-- Advisor 106 has 3 students
(106, 42),
(106, 43),
(106, 44),

-- Advisor 107 has 3 students
(107, 45),
(107, 46),
(107, 47),

-- Advisor 108 has a different number of students (4)
(108, 48),
(108, 49),
(108, 50),
(108, 51),

-- Advisor 109 has 3 students
(109, 52),
(109, 53),
(109, 54),

-- Advisor 110 has 3 students
(110, 55),
(110, 56),
(110, 57),

-- Advisor 111 has 3 students
(111, 58),
(111, 59),
(111, 60),

-- Advisor 112 has 3 students
(112, 61),
(112, 62),
(112, 63),

-- Advisor 113 has 3 students
(113, 64),
(113, 65),
(113, 66),

-- Advisor 114 has 3 students
(114, 67),
(114, 68),
(114, 69),

-- Advisor 115 has 3 students
(115, 70),
(115, 71),
(115, 72),

-- Advisor 116 has 3 students
(116, 73),
(116, 74),
(116, 75),

-- Advisor 117 has 3 students
(117, 76),
(117, 77),
(117, 78),

-- Advisor 118 has 3 students
(118, 79),
(118, 80),
(118, 41),

-- Advisor 119 has 3 students
(119, 42),
(119, 43),
(119, 44),

-- Advisor 120 has 3 students
(120, 45),
(120, 46),
(120, 47);

-- Insert resumes with mock binary data
INSERT INTO resumes (student_id, resume) VALUES
(41, 0x255044462D4D4F434B2D41415C), -- '%PDF-MOCK-AA\'
(42, 0x255044462D4D4F434B2D41425C), -- '%PDF-MOCK-AB\'
(43, 0x255044462D4D4F434B2D41435C), -- '%PDF-MOCK-AC\'
(44, 0x255044462D4D4F434B2D41445C), -- '%PDF-MOCK-AD\'
(45, 0x255044462D4D4F434B2D41455C), -- '%PDF-MOCK-AE\'
(46, 0x255044462D4D4F434B2D41465C), -- '%PDF-MOCK-AF\'
(47, 0x255044462D4D4F434B2D41475C), -- '%PDF-MOCK-AG\'
(48, 0x255044462D4D4F434B2D41485C), -- '%PDF-MOCK-AH\'
(49, 0x255044462D4D4F434B2D41495C), -- '%PDF-MOCK-AI\'
(50, 0x255044462D4D4F434B2D414A5C), -- '%PDF-MOCK-AJ\'
(51, 0x255044462D4D4F434B2D414B5C), -- '%PDF-MOCK-AK\'
(52, 0x255044462D4D4F434B2D414C5C), -- '%PDF-MOCK-AL\'
(53, 0x255044462D4D4F434B2D414D5C), -- '%PDF-MOCK-AM\'
(54, 0x255044462D4D4F434B2D414E5C), -- '%PDF-MOCK-AN\'
(55, 0x255044462D4D4F434B2D414F5C), -- '%PDF-MOCK-AO\'
(56, 0x255044462D4D4F434B2D41505C), -- '%PDF-MOCK-AP\'
(57, 0x255044462D4D4F434B2D41515C), -- '%PDF-MOCK-AQ\'
(58, 0x255044462D4D4F434B2D41525C), -- '%PDF-MOCK-AR\'
(59, 0x255044462D4D4F434B2D41535C), -- '%PDF-MOCK-AS\'
(60, 0x255044462D4D4F434B2D41545C), -- '%PDF-MOCK-AT\'
(61, 0x255044462D4D4F434B2D41555C), -- '%PDF-MOCK-AU\'
(62, 0x255044462D4D4F434B2D41565C), -- '%PDF-MOCK-AV\'
(63, 0x255044462D4D4F434B2D41575C), -- '%PDF-MOCK-AW\'
(64, 0x255044462D4D4F434B2D41585C), -- '%PDF-MOCK-AX\'
(65, 0x255044462D4D4F434B2D41595C), -- '%PDF-MOCK-AY\'
(66, 0x255044462D4D4F434B2D415A5C), -- '%PDF-MOCK-AZ\'
(67, 0x255044462D4D4F434B2D42415C), -- '%PDF-MOCK-BA\'
(68, 0x255044462D4D4F434B2D42425C), -- '%PDF-MOCK-BB\'
(69, 0x255044462D4D4F434B2D42435C), -- '%PDF-MOCK-BC\'
(70, 0x255044462D4D4F434B2D42445C), -- '%PDF-MOCK-BD\'
(71, 0x255044462D4D4F434B2D42455C), -- '%PDF-MOCK-BE\'
(72, 0x255044462D4D4F434B2D42465C), -- '%PDF-MOCK-BF\'
(73, 0x255044462D4D4F434B2D42475C), -- '%PDF-MOCK-BG\'
(74, 0x255044462D4D4F434B2D42485C), -- '%PDF-MOCK-BH\'
(75, 0x255044462D4D4F434B2D42495C), -- '%PDF-MOCK-BI\'
(76, 0x255044462D4D4F434B2D424A5C), -- '%PDF-MOCK-BJ\'
(77, 0x255044462D4D4F434B2D424B5C), -- '%PDF-MOCK-BK\'
(78, 0x255044462D4D4F434B2D424C5C), -- '%PDF-MOCK-BL\'
(79, 0x255044462D4D4F434B2D424D5C), -- '%PDF-MOCK-BM\'
(80, 0x255044462D4D4F434B2D424E5C); -- '%PDF-MOCK-BN\'

-- Insert resume feedback
INSERT INTO resume_feedback (advisor_id, resume_id, upload_date, score, feedback) VALUES
(81, 1, '2025-02-15 10:30:00', 4.5, 'Excellent format and content. Consider adding more detail to your project descriptions.'),
(82, 2, '2025-02-16 11:45:00', 3.8, 'Good overall. Add more quantifiable achievements to strengthen your impact.'),
(83, 3, '2025-02-17 09:20:00', 4.2, 'Strong presentation of technical skills. Work experience section needs more detail.'),
(84, 4, '2025-02-17 14:15:00', 3.5, 'Needs better organization. Highlight your relevant coursework more prominently.'),
(85, 5, '2025-02-18 16:30:00', 4.0, 'Well-structured. Consider adding certifications section.'),
(86, 6, '2025-02-19 13:45:00', 3.7, 'Good start but needs more professional experience details.'),
(87, 7, '2025-02-20 11:10:00', 4.3, 'Excellent skills section. Add more about team projects.'),
(88, 8, '2025-02-21 15:25:00', 3.9, 'Format is clean. Add more specific technologies youve worked with.'),
(89, 9, '2025-02-22 10:05:00', 4.1, 'Strong academic section. Consider reorganizing to put experience first.'),
(90, 10, '2025-02-23 14:50:00', 3.4, 'Needs more focus on relevant skills for your target positions.'),
(91, 11, '2025-02-24 09:30:00', 4.6, 'Excellent content and organization. Minor formatting issues.'),
(92, 12, '2025-02-25 12:15:00', 3.8, 'Good details but consider condensing to one page.'),
(93, 13, '2025-02-26 16:45:00', 4.2, 'Strong technical resume. Add more soft skills.'),
(94, 14, '2025-02-27 11:20:00', 3.6, 'Content is relevant but format needs improvement.'),
(95, 15, '2025-02-28 14:30:00', 4.3, 'Excellent presentation. Add LinkedIn and GitHub links.'),
(96, 16, '2025-03-01 10:15:00', 3.5, 'Needs more detailed descriptions of responsibilities.'),
(97, 17, '2025-03-02 13:40:00', 4.0, 'Well-structured. Consider adding a summary statement.'),
(98, 18, '2025-03-03 15:55:00', 3.7, 'Good experience section. Skills need more organization.'),
(99, 19, '2025-03-04 09:25:00', 4.4, 'Excellent format. Add more metrics to show impact.'),
(100, 20, '2025-03-05 11:30:00', 3.9, 'Content is strong. Consider using bullet points consistently.'),
(101, 21, '2025-03-06 14:20:00', 4.1, 'Well-presented technical skills. Add more about academic projects.'),
(102, 22, '2025-03-07 16:15:00', 3.5, 'Good start but needs better organization and formatting.'),
(103, 23, '2025-03-08 10:45:00', 4.2, 'Strong content. Consider tailoring more for specific industry.'),
(104, 24, '2025-03-09 13:30:00', 3.8, 'Good experience section. Skills list could be more comprehensive.'),
(105, 25, '2025-03-10 15:50:00', 4.0, 'Well-balanced resume. Minor formatting inconsistencies.'),
(106, 26, '2025-03-11 09:15:00', 3.6, 'Content is relevant but consider reorganizing sections.'),
(107, 27, '2025-03-12 11:40:00', 4.3, 'Excellent presentation of leadership experience. Add more technical details.'),
(108, 28, '2025-03-13 14:25:00', 3.7, 'Good academic credentials. Experience section needs more detail.'),
(109, 29, '2025-03-14 16:20:00', 4.1, 'Strong overall. Consider adding volunteer experience.'),
(110, 30, '2025-03-15 10:30:00', 3.5, 'Needs more specifics about project contributions.'),
(81, 31, '2025-03-16 13:15:00', 4.4, 'Excellent organization. Add more about technical tools used.'),
(82, 32, '2025-03-17 15:45:00', 3.8, 'Good content. Consider using stronger action verbs.'),
(83, 33, '2025-03-18 09:20:00', 4.2, 'Strong technical resume. Consider adding relevant coursework.'),
(84, 34, '2025-03-19 11:50:00', 3.6, 'Needs better prioritization of most relevant experiences.'),
(85, 35, '2025-03-20 14:30:00', 4.0, 'Well-structured. Add more specific achievements.'),
(86, 36, '2025-03-21 16:15:00', 3.7, 'Good skills section. Experience needs more quantifiable results.'),
(87, 37, '2025-03-22 10:40:00', 4.3, 'Excellent presentation. Consider adding a projects section.'),
(88, 38, '2025-03-23 13:25:00', 3.9, 'Good technical details. Format could be more consistent.'),
(89, 39, '2025-03-24 15:55:00', 4.1, 'Strong academic credentials. Add more industry-specific keywords.'),
(90, 40, '2025-03-25 09:30:00', 3.6, 'Content is relevant but needs better organization.'),
(91, 1, '2025-03-26 11:45:00', 4.5, 'Great improvement since last review. Now excellent overall.'),
(92, 2, '2025-03-27 14:20:00', 4.0, 'Much better organization. Consider adding more technical specifics.'),
(93, 3, '2025-03-28 16:30:00', 4.4, 'Excellent revision. Format and content are now very strong.'),
(94, 4, '2025-03-29 10:15:00', 3.9, 'Good improvements. Continue focusing on quantifiable achievements.'),
(95, 5, '2025-03-30 13:40:00', 4.2, 'Much stronger than previous version. Well done on the reorganization.'),
(96, 6, '2025-03-31 15:25:00', 3.8, 'Good progress. Skills section is now much more comprehensive.'),
(97, 7, '2025-04-01 09:50:00', 4.5, 'Excellent revision. Your experience is now clearly presented.'),
(98, 8, '2025-04-02 11:35:00', 4.0, 'Great improvement in formatting and organization.'),
(99, 9, '2025-04-03 14:10:00', 4.3, 'Strong revision. Technical skills are now well-highlighted.'),
(100, 10, '2025-04-04 16:45:00', 3.9, 'Much better focus on relevant experience. Continue improving descriptions.');

-- Insert student skills
INSERT INTO student_skills (student_id, skill_id) VALUES
-- Student 41 has 4 skills
(41, 1),  -- Java Programming
(41, 3),  -- Data Analysis
(41, 8),  -- SQL
(41, 9),  -- Python

-- Student 42 has 3 skills
(42, 2),  -- Project Management
(42, 5),  -- Public Speaking
(42, 15), -- Digital Marketing

-- Student 43 has 3 skills
(43, 4),  -- JavaScript
(43, 18), -- HTML/CSS
(43, 29), -- React

-- Student 44 has 3 skills
(44, 10), -- Critical Thinking
(44, 20), -- Research
(44, 21), -- Communication

-- Student 45 has 4 skills
(45, 3),  -- Data Analysis
(45, 16), -- Machine Learning
(45, 33), -- Statistical Analysis
(45, 9),  -- Python

-- Student 46 has 3 skills
(46, 13), -- Adobe Photoshop
(46, 24), -- UX Design
(46, 36), -- UI Design

-- Student 47 has 3 skills
(47, 7),  -- Team Leadership
(47, 2),  -- Project Management
(47, 19), -- Agile Methodology

-- Student 48 has 3 skills
(48, 8),  -- SQL
(48, 27), -- Database Administration
(48, 37), -- Cloud Computing

-- Student 49 has 3 skills
(49, 12), -- Microsoft Office
(49, 23), -- Accounting
(49, 17), -- Financial Analysis

-- Student 50 has 4 skills
(50, 3),  -- Data Analysis
(50, 6),  -- Problem Solving
(50, 9),  -- Python
(50, 16), -- Machine Learning

-- Student 51 has 3 skills
(51, 14), -- Content Writing
(51, 26), -- Social Media Management
(51, 38), -- SEO

-- Student 52 has 3 skills
(52, 11), -- Customer Service
(52, 21), -- Communication
(52, 35), -- Sales

-- Student 53 has 3 skills
(53, 1),  -- Java Programming
(53, 22), -- C++
(53, 34), -- Mobile Development

-- Student 54 has 3 skills
(54, 4),  -- JavaScript
(54, 18), -- HTML/CSS
(54, 40), -- Node.js

-- Student 55 has 3 skills
(55, 3),  -- Data Analysis
(55, 17), -- Financial Analysis
(55, 30), -- Business Strategy

-- Student 56 has 3 skills
(56, 13), -- Adobe Photoshop
(56, 36), -- UI Design
(56, 39), -- Video Editing

-- Student 57 has 3 skills
(57, 2),  -- Project Management
(57, 19), -- Agile Methodology
(57, 32), -- Product Development

-- Student 58 has 3 skills
(58, 8),  -- SQL
(58, 9),  -- Python
(58, 28), -- Quality Assurance

-- Student 59 has 3 skills
(59, 6),  -- Problem Solving
(59, 21), -- Communication
(59, 10), -- Critical Thinking

-- Student 60 has 4 skills
(60, 16), -- Machine Learning
(60, 9),  -- Python
(60, 3),  -- Data Analysis
(60, 33), -- Statistical Analysis

-- Student 61 has 3 skills
(61, 4),  -- JavaScript
(61, 29), -- React
(61, 18), -- HTML/CSS

-- Student 62 has 3 skills
(62, 7),  -- Team Leadership
(62, 30), -- Business Strategy
(62, 32), -- Product Development

-- Student 63 has 3 skills
(63, 1),  -- Java Programming
(63, 22), -- C++
(63, 9),  -- Python

-- Student 64 has 3 skills
(64, 5),  -- Public Speaking
(64, 20), -- Research
(64, 21), -- Communication

-- Student 65 has 3 skills
(65, 13), -- Adobe Photoshop
(65, 36), -- UI Design
(65, 24), -- UX Design

-- Student 66 has 3 skills
(66, 14), -- Content Writing
(66, 31), -- Technical Writing
(66, 21), -- Communication

-- Student 67 has 3 skills
(67, 8),  -- SQL
(67, 27), -- Database Administration
(67, 3),  -- Data Analysis

-- Student 68 has 3 skills
(68, 25), -- Network Security
(68, 37), -- Cloud Computing
(68, 6),  -- Problem Solving

-- Student 69 has 3 skills
(69, 2),  -- Project Management
(69, 19), -- Agile Methodology
(69, 28), -- Quality Assurance

-- Student 70 has 3 skills
(70, 4),  -- JavaScript
(70, 18), -- HTML/CSS
(70, 33), -- Statistical Analysis

-- Student 71 has 3 skills
(71, 26), -- Social Media Management
(71, 15), -- Digital Marketing
(71, 38), -- SEO

-- Student 72 has 3 skills
(72, 9),  -- Python
(72, 16), -- Machine Learning
(72, 33), -- Statistical Analysis

-- Student 73 has 3 skills
(73, 7),  -- Team Leadership
(73, 5),  -- Public Speaking
(73, 11), -- Customer Service

-- Student 74 has 3 skills
(74, 12), -- Microsoft Office
(74, 21), -- Communication
(74, 2),  -- Project Management

-- Student 75 has 3 skills
(75, 1),  -- Java Programming
(75, 4),  -- JavaScript
(75, 8),  -- SQL

-- Student 76 has 3 skills
(76, 13), -- Adobe Photoshop
(76, 39), -- Video Editing
(76, 36), -- UI Design

-- Student 77 has 3 skills
(77, 6),  -- Problem Solving
(77, 10), -- Critical Thinking
(77, 20), -- Research

-- Student 78 has 3 skills
(78, 17), -- Financial Analysis
(78, 23), -- Accounting
(78, 30), -- Business Strategy

-- Student 79 has 3 skills
(79, 9),  -- Python
(79, 3),  -- Data Analysis
(79, 16), -- Machine Learning

-- Student 80 has 3 skills
(80, 22), -- C++
(80, 25), -- Network Security
(80, 28)  -- Quality Assurance
;

-- Insert job posting skills
INSERT INTO job_posting_skills (job_id, skill_id) VALUES
-- Job 1: Senior Software Engineer (5 skills)
(1, 1),  -- Java Programming
(1, 9),  -- Python
(1, 22), -- C++
(1, 6),  -- Problem Solving
(1, 19), -- Agile Methodology

-- Job 2: Marketing Manager (3 skills)
(2, 15), -- Digital Marketing
(2, 26), -- Social Media Management
(2, 38), -- SEO

-- Job 3: Data Analyst (4 skills)
(3, 3),  -- Data Analysis
(3, 9),  -- Python
(3, 33), -- Statistical Analysis
(3, 8),  -- SQL

-- Job 4: Product Designer (3 skills)
(4, 24), -- UX Design
(4, 36), -- UI Design
(4, 13), -- Adobe Photoshop

-- Job 5: Financial Advisor (3 skills)
(5, 17), -- Financial Analysis
(5, 23), -- Accounting
(5, 30), -- Business Strategy

-- Job 6: Customer Support Specialist (3 skills)
(6, 11), -- Customer Service
(6, 21), -- Communication
(6, 12), -- Microsoft Office

-- Job 7: Project Manager (4 skills)
(7, 2),  -- Project Management
(7, 7),  -- Team Leadership
(7, 19), -- Agile Methodology
(7, 6),  -- Problem Solving

-- Job 8: Human Resources Coordinator (3 skills)
(8, 21), -- Communication
(8, 12), -- Microsoft Office
(8, 7),  -- Team Leadership

-- Job 9: Full Stack Developer (4 skills)
(9, 4),  -- JavaScript
(9, 18), -- HTML/CSS
(9, 8),  -- SQL
(9, 29), -- React

-- Job 10: Sales Representative (3 skills)
(10, 35), -- Sales
(10, 21), -- Communication
(10, 10), -- Critical Thinking

-- Job 11: UX/UI Designer (3 skills)
(11, 24), -- UX Design
(11, 36), -- UI Design
(11, 13), -- Adobe Photoshop

-- Job 12: Business Analyst (3 skills)
(12, 3),  -- Data Analysis
(12, 30), -- Business Strategy
(12, 12), -- Microsoft Office

-- Job 13: Network Administrator (3 skills)
(13, 25), -- Network Security
(13, 37), -- Cloud Computing
(13, 6),  -- Problem Solving

-- Job 14: Content Writer (3 skills)
(14, 14), -- Content Writing
(14, 21), -- Communication
(14, 38), -- SEO

-- Job 15: Quality Assurance Engineer (3 skills)
(15, 28), -- Quality Assurance
(15, 19), -- Agile Methodology
(15, 6),  -- Problem Solving

-- Job 16: Graphic Designer (3 skills)
(16, 13), -- Adobe Photoshop
(16, 36), -- UI Design
(16, 39), -- Video Editing

-- Job 17: Operations Manager (3 skills)
(17, 7),  -- Team Leadership
(17, 2),  -- Project Management
(17, 30), -- Business Strategy

-- Job 18: Research Scientist (3 skills)
(18, 20), -- Research
(18, 9),  -- Python
(18, 33), -- Statistical Analysis

-- Job 19: Social Media Coordinator (3 skills)
(19, 26), -- Social Media Management
(19, 15), -- Digital Marketing
(19, 14), -- Content Writing

-- Job 20: Front End Developer (3 skills)
(20, 4),  -- JavaScript
(20, 18), -- HTML/CSS
(20, 29), -- React

-- Job 21: Data Scientist (4 skills)
(21, 9),  -- Python
(21, 16), -- Machine Learning
(21, 3),  -- Data Analysis
(21, 33), -- Statistical Analysis

-- Job 22: Account Manager (3 skills)
(22, 21), -- Communication
(22, 7),  -- Team Leadership
(22, 35), -- Sales

-- Job 23: IT Support Specialist (3 skills)
(23, 6),  -- Problem Solving
(23, 21), -- Communication
(23, 25), -- Network Security

-- Job 24: Administrative Assistant (2 skills)
(24, 12), -- Microsoft Office
(24, 21), -- Communication

-- Job 25: Back End Developer (3 skills)
(25, 1),  -- Java Programming
(25, 8),  -- SQL
(25, 9),  -- Python

-- Job 26: Product Manager (3 skills)
(26, 2),  -- Project Management
(26, 32), -- Product Development
(26, 7),  -- Team Leadership

-- Job 27: Customer Success Manager (3 skills)
(27, 11), -- Customer Service
(27, 21), -- Communication
(27, 7),  -- Team Leadership

-- Job 28: Digital Marketing Specialist (3 skills)
(28, 15), -- Digital Marketing
(28, 26), -- Social Media Management
(28, 38), -- SEO

-- Job 29: Mobile App Developer (3 skills)
(29, 4),  -- JavaScript
(29, 34), -- Mobile Development
(29, 29), -- React

-- Job 30: Technical Writer (3 skills)
(30, 31), -- Technical Writing
(30, 21), -- Communication
(30, 14), -- Content Writing

-- Job 31: Systems Analyst (3 skills)
(31, 6),  -- Problem Solving
(31, 27), -- Database Administration
(31, 8),  -- SQL

-- Job 32: Supply Chain Manager (3 skills)
(32, 2),  -- Project Management
(32, 7),  -- Team Leadership
(32, 10), -- Critical Thinking

-- Job 33: Web Developer (3 skills)
(33, 4),  -- JavaScript
(33, 18), -- HTML/CSS
(33, 29), -- React

-- Job 34: DevOps Engineer (4 skills)
(34, 9),  -- Python
(34, 37), -- Cloud Computing
(34, 19), -- Agile Methodology
(34, 6),  -- Problem Solving

-- Job 35: Accounting Clerk (2 skills)
(35, 23), -- Accounting
(35, 12), -- Microsoft Office

-- Job 36: Machine Learning Engineer (4 skills)
(36, 9),  -- Python
(36, 16), -- Machine Learning
(36, 33), -- Statistical Analysis
(36, 3),  -- Data Analysis

-- Job 37: Executive Assistant (2 skills)
(37, 12), -- Microsoft Office
(37, 21), -- Communication

-- Job 38: Database Administrator (3 skills)
(38, 8),  -- SQL
(38, 27), -- Database Administration
(38, 6),  -- Problem Solving

-- Job 39: Software Developer Intern (4 skills)
(39, 1),  -- Java Programming
(39, 4),  -- JavaScript
(39, 9),  -- Python
(39, 18), -- HTML/CSS

-- Job 40: Customer Experience Manager (3 skills)
(40, 11), -- Customer Service
(40, 21), -- Communication
(40, 7),  -- Team Leadership

-- Additional skill mappings to reach 125 rows
-- Adding more skills to existing jobs

-- Additional skills for Job 1
(1, 8),   -- SQL
(1, 29),  -- React

-- Additional skills for Job 3
(3, 10),  -- Critical Thinking
(3, 16),  -- Machine Learning

-- Additional skills for Job 7
(7, 21),  -- Communication
(7, 30),  -- Business Strategy

-- Additional skills for Job 9
(9, 40),  -- Node.js
(9, 19),  -- Agile Methodology

-- Additional skills for Job 11
(11, 39), -- Video Editing
(11, 14), -- Content Writing

-- Additional skills for Job 13
(13, 21), -- Communication
(13, 28), -- Quality Assurance

-- Additional skills for Job 15
(15, 21), -- Communication
(15, 9),  -- Python

-- Additional skills for Job 17
(17, 10), -- Critical Thinking
(17, 21), -- Communication

-- Additional skills for Job 21
(21, 8),  -- SQL
(21, 10), -- Critical Thinking

-- Additional skills for Job 22
(22, 30), -- Business Strategy
(22, 2),  -- Project Management

-- Additional skills for Job 25
(25, 22), -- C++
(25, 40), -- Node.js

-- Additional skills for Job 26
(26, 10), -- Critical Thinking
(26, 21), -- Communication

-- Additional skills for Job 29
(29, 1),  -- Java Programming
(29, 18), -- HTML/CSS

-- Additional skills for Job 33
(33, 40), -- Node.js
(33, 8),  -- SQL

-- Additional skills for Job 34
(34, 25), -- Network Security
(34, 8),  -- SQL

-- Additional skills for Job 36
(36, 10), -- Critical Thinking
(36, 22), -- C++

-- Additional skills for Job 38
(38, 37), -- Cloud Computing
(38, 9),  -- Python

-- Additional skills for Job 39
(39, 6),  -- Problem Solving
(39, 29), -- React

-- Additional cross-functional skills that appear in multiple job types
(2, 21),  -- Communication for Marketing Manager
(4, 21),  -- Communication for Product Designer
(5, 21),  -- Communication for Financial Advisor
(12, 21), -- Communication for Business Analyst
(16, 21), -- Communication for Graphic Designer
(18, 21), -- Communication for Research Scientist
(20, 21), -- Communication for Front End Developer
(25, 6),  -- Problem Solving for Back End Developer
(26, 6),  -- Problem Solving for Product Manager
(28, 21), -- Communication for Digital Marketing Specialist
(32, 21), -- Communication for Supply Chain Manager
(35, 21), -- Communication for Accounting Clerk
(36, 21), -- Communication for Machine Learning Engineer
(40, 10)  -- Critical Thinking for Customer Experience Manager
;

-- Insert applications
INSERT INTO applications (student_id, job_id, date_applied, status) VALUES
-- Students applying for various jobs with different statuses
(41, 1, '2025-03-15', 'pending'),
(42, 5, '2025-03-16', 'accepted'),
(43, 9, '2025-03-17', 'rejected'),
(44, 13, '2025-03-18', 'interview'),
(45, 17, '2025-03-19', 'pending'),
(46, 21, '2025-03-20', 'accepted'),
(47, 25, '2025-03-21', 'rejected'),
(48, 29, '2025-03-22', 'interview'),
(49, 33, '2025-03-23', 'pending'),
(50, 37, '2025-03-24', 'accepted'),
(51, 2, '2025-03-25', 'rejected'),
(52, 6, '2025-03-26', 'interview'),
(53, 10, '2025-03-27', 'pending'),
(54, 14, '2025-03-28', 'accepted'),
(55, 18, '2025-03-29', 'rejected'),
(56, 22, '2025-03-30', 'interview'),
(57, 26, '2025-03-31', 'pending'),
(58, 30, '2025-04-01', 'accepted'),
(59, 34, '2025-04-02', 'rejected'),
(60, 38, '2025-04-03', 'interview'),
(61, 3, '2025-04-04', 'pending'),
(62, 7, '2025-04-05', 'accepted'),
(63, 11, '2025-04-06', 'rejected'),
(64, 15, '2025-04-07', 'interview'),
(65, 19, '2025-04-08', 'pending'),
(66, 23, '2025-04-09', 'accepted'),
(67, 27, '2025-04-10', 'rejected'),
(68, 31, '2025-04-11', 'interview'),
(69, 35, '2025-04-12', 'pending'),
(70, 39, '2025-04-13', 'accepted'),
(71, 4, '2025-04-14', 'rejected'),
(72, 8, '2025-04-15', 'interview'),
(73, 12, '2025-04-16', 'pending'),
(74, 16, '2025-04-17', 'accepted'),
(75, 20, '2025-04-18', 'rejected'),
(76, 24, '2025-04-19', 'interview'),
(77, 28, '2025-04-20', 'pending'),
(78, 32, '2025-04-21', 'accepted'),
(79, 36, '2025-04-22', 'rejected'),
(80, 40, '2025-04-23', 'interview');

-- Insert issue reports
INSERT INTO issue_reports (user_id, date_created, type, status, description) VALUES
-- Various users reporting different types of issues
(1, '2025-03-15 09:30:00', 'Login Issue', 'open', 'Cannot access account after password reset'),
(5, '2025-03-16 10:45:00', 'Profile Update', 'resolved', 'Unable to update profile picture'),
(12, '2025-03-17 11:20:00', 'Job Application', 'in progress', 'Application submission error for job #15'),
(18, '2025-03-18 13:15:00', 'Resume Upload', 'open', 'System rejects PDF larger than 2MB'),
(23, '2025-03-19 14:30:00', 'Search Function', 'resolved', 'Job search not returning relevant results'),
(31, '2025-03-20 15:45:00', 'Notification', 'in progress', 'Not receiving email notifications'),
(42, '2025-03-21 09:10:00', 'Password Reset', 'open', 'Reset link in email not working'),
(47, '2025-03-22 10:25:00', 'Account Access', 'resolved', 'Account locked after multiple login attempts'),
(53, '2025-03-23 11:40:00', 'Application Status', 'in progress', 'Status shows pending for over 2 weeks'),
(58, '2025-03-24 13:55:00', 'Profile Visibility', 'open', 'Profile not visible to employers'),
(64, '2025-03-25 14:15:00', 'Document Download', 'resolved', 'Cannot download offer letter'),
(69, '2025-03-26 15:30:00', 'Mobile Access', 'in progress', 'Mobile site not loading properly'),
(75, '2025-03-27 09:45:00', 'Interview Schedule', 'open', 'Calendar invite not syncing correctly'),
(80, '2025-03-28 10:20:00', 'Skill Assessment', 'resolved', 'Test freezes halfway through completion'),
(3, '2025-03-29 11:35:00', 'Job Posting', 'in progress', 'Posted job not appearing in search results'),
(8, '2025-03-30 13:50:00', 'Payment Issue', 'open', 'Premium subscription charge error'),
(14, '2025-03-31 14:25:00', 'Account Deletion', 'resolved', 'Cannot find option to delete account'),
(20, '2025-04-01 15:40:00', 'Data Export', 'in progress', 'Downloaded data missing application history'),
(26, '2025-04-02 09:05:00', 'Security Alert', 'open', 'Suspicious login attempt notification'),
(32, '2025-04-03 10:15:00', 'Message Center', 'resolved', 'Cannot send messages to employers'),
(38, '2025-04-04 11:30:00', 'Profile Matching', 'in progress', 'Skills not matching with appropriate jobs'),
(44, '2025-04-05 13:45:00', 'Dashboard Loading', 'open', 'Dashboard statistics not updating'),
(50, '2025-04-06 14:20:00', 'Feature Request', 'resolved', 'Suggestion for improved filter options'),
(56, '2025-04-07 15:35:00', 'Browser Compatibility', 'in progress', 'Site not working properly in Firefox'),
(62, '2025-04-08 09:50:00', 'Form Submission', 'open', 'Contact form submission error'),
(68, '2025-04-09 10:05:00', 'Data Accuracy', 'resolved', 'Job location information incorrect'),
(74, '2025-04-10 11:25:00', 'API Integration', 'in progress', 'LinkedIn profile import not working'),
(79, '2025-04-11 13:40:00', 'Account Merge', 'open', 'Unable to merge duplicate accounts'),
(2, '2025-04-12 14:55:00', 'Privacy Settings', 'resolved', 'Cannot update privacy preferences'),
(7, '2025-04-13 15:10:00', 'Document Format', 'in progress', 'Resume formatting lost when converted'),
(13, '2025-04-14 09:35:00', 'Job Alert', 'open', 'Job alerts not matching preferences'),
(19, '2025-04-15 10:50:00', 'Content Moderation', 'resolved', 'Inappropriate content in job posting'),
(25, '2025-04-16 11:15:00', 'Performance Issue', 'in progress', 'Site extremely slow during peak hours'),
(30, '2025-04-17 13:30:00', 'Authentication', 'open', 'Two-factor authentication not sending codes'),
(36, '2025-04-18 14:45:00', 'Database Error', 'resolved', 'Profile information missing after update'),
(41, '2025-04-19 15:20:00', 'User Interface', 'in progress', 'Buttons not responsive on touch devices'),
(46, '2025-04-20 09:40:00', 'Search Filters', 'open', 'Saved search filters not applying correctly'),
(52, '2025-04-21 10:55:00', 'Report Generation', 'resolved', 'Application analytics report empty'),
(57, '2025-04-22 11:10:00', 'Accessibility Issue', 'in progress', 'Screen reader compatibility issues'),
(63, '2025-04-23 13:25:00', 'Network Error', 'open', 'Timeout errors when uploading large files');

-- Insert admin
INSERT INTO admins (user_id) VALUES
(121),
(122),
(123),
(124),
(125),
(126),
(127),
(128),
(129),
(130),
(131),
(132),
(133),
(134),
(135),
(136),
(137),
(138),
(139),
(140),
(141),
(142),
(143),
(144),
(145),
(146),
(147),
(148),
(149),
(150),
(151),
(152),
(153),
(154),
(155),
(156),
(157),
(158),
(159),
(160);
