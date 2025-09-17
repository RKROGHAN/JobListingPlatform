-- Job Portal Database Setup Script
-- Run this script in MySQL to create the database and initial data

-- Create database
CREATE DATABASE IF NOT EXISTS job_portal_db;
USE job_portal_db;

-- Create initial categories
INSERT INTO categories (name, description, icon, color, is_active, created_at, updated_at) VALUES
('Technology', 'Software development, IT, and technology roles', '💻', '#1976d2', true, NOW(), NOW()),
('Healthcare', 'Medical, nursing, and healthcare positions', '🏥', '#4caf50', true, NOW(), NOW()),
('Finance', 'Banking, accounting, and financial services', '💰', '#ff9800', true, NOW(), NOW()),
('Education', 'Teaching, training, and educational roles', '📚', '#9c27b0', true, NOW(), NOW()),
('Marketing', 'Digital marketing, advertising, and PR', '📢', '#f44336', true, NOW(), NOW()),
('Sales', 'Sales, business development, and customer relations', '💼', '#00bcd4', true, NOW(), NOW()),
('Design', 'UI/UX, graphic design, and creative roles', '🎨', '#e91e63', true, NOW(), NOW()),
('Engineering', 'Mechanical, electrical, and civil engineering', '⚙️', '#795548', true, NOW(), NOW());

-- Create initial skills
INSERT INTO skills (name, description, category, is_active, created_at, updated_at) VALUES
-- Programming Languages
('Java', 'Java programming language', 'PROGRAMMING_LANGUAGES', true, NOW(), NOW()),
('Python', 'Python programming language', 'PROGRAMMING_LANGUAGES', true, NOW(), NOW()),
('JavaScript', 'JavaScript programming language', 'PROGRAMMING_LANGUAGES', true, NOW(), NOW()),
('TypeScript', 'TypeScript programming language', 'PROGRAMMING_LANGUAGES', true, NOW(), NOW()),
('C++', 'C++ programming language', 'PROGRAMMING_LANGUAGES', true, NOW(), NOW()),
('C#', 'C# programming language', 'PROGRAMMING_LANGUAGES', true, NOW(), NOW()),
('Go', 'Go programming language', 'PROGRAMMING_LANGUAGES', true, NOW(), NOW()),
('Rust', 'Rust programming language', 'PROGRAMMING_LANGUAGES', true, NOW(), NOW()),

-- Frameworks
('Spring Boot', 'Spring Boot framework for Java', 'FRAMEWORKS', true, NOW(), NOW()),
('React', 'React JavaScript library', 'FRAMEWORKS', true, NOW(), NOW()),
('Angular', 'Angular framework', 'FRAMEWORKS', true, NOW(), NOW()),
('Vue.js', 'Vue.js framework', 'FRAMEWORKS', true, NOW(), NOW()),
('Node.js', 'Node.js runtime', 'FRAMEWORKS', true, NOW(), NOW()),
('Django', 'Django Python framework', 'FRAMEWORKS', true, NOW(), NOW()),
('Flask', 'Flask Python framework', 'FRAMEWORKS', true, NOW(), NOW()),
('Express.js', 'Express.js framework', 'FRAMEWORKS', true, NOW(), NOW()),

-- Databases
('MySQL', 'MySQL database', 'DATABASES', true, NOW(), NOW()),
('PostgreSQL', 'PostgreSQL database', 'DATABASES', true, NOW(), NOW()),
('MongoDB', 'MongoDB database', 'DATABASES', true, NOW(), NOW()),
('Redis', 'Redis database', 'DATABASES', true, NOW(), NOW()),
('Oracle', 'Oracle database', 'DATABASES', true, NOW(), NOW()),
('SQL Server', 'Microsoft SQL Server', 'DATABASES', true, NOW(), NOW()),

-- Tools
('Git', 'Version control system', 'TOOLS', true, NOW(), NOW()),
('Docker', 'Containerization platform', 'TOOLS', true, NOW(), NOW()),
('Kubernetes', 'Container orchestration', 'TOOLS', true, NOW(), NOW()),
('AWS', 'Amazon Web Services', 'TOOLS', true, NOW(), NOW()),
('Azure', 'Microsoft Azure', 'TOOLS', true, NOW(), NOW()),
('GCP', 'Google Cloud Platform', 'TOOLS', true, NOW(), NOW()),
('Jenkins', 'CI/CD automation', 'TOOLS', true, NOW(), NOW()),
('GitLab', 'DevOps platform', 'TOOLS', true, NOW(), NOW()),

-- Soft Skills
('Communication', 'Verbal and written communication', 'SOFT_SKILLS', true, NOW(), NOW()),
('Leadership', 'Team leadership and management', 'SOFT_SKILLS', true, NOW(), NOW()),
('Problem Solving', 'Analytical and problem-solving skills', 'SOFT_SKILLS', true, NOW(), NOW()),
('Teamwork', 'Collaboration and teamwork', 'SOFT_SKILLS', true, NOW(), NOW()),
('Time Management', 'Project and time management', 'SOFT_SKILLS', true, NOW(), NOW()),
('Adaptability', 'Flexibility and adaptability', 'SOFT_SKILLS', true, NOW(), NOW());

-- Create sample admin user (password: admin123)
INSERT INTO users (first_name, last_name, email, password, phone, role, is_active, is_verified, created_at, updated_at) VALUES
('Admin', 'User', 'admin@jobportal.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iYqiSfF1wJwQvKvQvKvQvKvQvKvQ', '+1234567890', 'ADMIN', true, true, NOW(), NOW());

-- Create sample job seeker user (password: user123)
INSERT INTO users (first_name, last_name, email, password, phone, role, is_active, is_verified, created_at, updated_at) VALUES
('John', 'Doe', 'john.doe@email.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iYqiSfF1wJwQvKvQvKvQvKvQvKvQ', '+1234567891', 'JOB_SEEKER', true, true, NOW(), NOW());

-- Create sample employer user (password: employer123)
INSERT INTO users (first_name, last_name, email, password, phone, role, is_active, is_verified, created_at, updated_at) VALUES
('Jane', 'Smith', 'jane.smith@company.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iYqiSfF1wJwQvKvQvKvQvKvQvKvQ', '+1234567892', 'EMPLOYER', true, true, NOW(), NOW());

-- Create sample company
INSERT INTO companies (name, description, website, email, phone, address, city, state, zip_code, country, industry, company_size, founded_year, is_verified, is_active, user_id, created_at, updated_at) VALUES
('TechCorp Solutions', 'Leading technology company specializing in software development and digital transformation', 'https://techcorp.com', 'info@techcorp.com', '+1234567893', '123 Tech Street', 'San Francisco', 'CA', '94105', 'USA', 'Technology', '100-500', 2010, true, true, 3, NOW(), NOW());

-- Create sample jobs
INSERT INTO jobs (title, description, location, job_type, experience_level, min_salary, max_salary, currency, is_remote, is_active, application_deadline, requirements, benefits, application_instructions, views_count, applications_count, posted_by_id, company_id, category_id, created_at, updated_at) VALUES
('Senior Java Developer', 'We are looking for an experienced Java developer to join our team. You will be responsible for developing high-quality software solutions using Java, Spring Boot, and related technologies.', 'San Francisco, CA', 'FULL_TIME', 'SENIOR_LEVEL', 120000, 150000, 'USD', true, true, DATE_ADD(NOW(), INTERVAL 30 DAY), '5+ years of Java experience, Spring Boot, REST APIs, Microservices', 'Health insurance, 401k, flexible work hours, remote work', 'Please submit your resume and cover letter', 0, 0, 3, 1, 1, NOW(), NOW()),
('Frontend React Developer', 'Join our frontend team to build amazing user interfaces using React, TypeScript, and modern web technologies.', 'New York, NY', 'FULL_TIME', 'MID_LEVEL', 90000, 120000, 'USD', true, true, DATE_ADD(NOW(), INTERVAL 25 DAY), '3+ years of React experience, TypeScript, CSS, HTML', 'Health insurance, 401k, professional development budget', 'Please include your portfolio and GitHub profile', 0, 0, 3, 1, 1, NOW(), NOW()),
('DevOps Engineer', 'We need a DevOps engineer to help us scale our infrastructure and improve our deployment processes.', 'Austin, TX', 'FULL_TIME', 'MID_LEVEL', 100000, 130000, 'USD', false, true, DATE_ADD(NOW(), INTERVAL 20 DAY), 'AWS, Docker, Kubernetes, CI/CD, Linux', 'Health insurance, 401k, stock options', 'Please describe your experience with cloud platforms', 0, 0, 3, 1, 1, NOW(), NOW());

COMMIT;
