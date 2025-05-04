-- Drop tables if they already exist (for fresh import)
DROP TABLE IF EXISTS enrollments, students, courses, departments, sex, country;

-- Lookup Table: Sex
CREATE TABLE sex (
    sex_id INT PRIMARY KEY AUTO_INCREMENT,
    label VARCHAR(10) UNIQUE NOT NULL -- e.g., Male, Female, Other
);

-- Lookup Table: Country
CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- Students Table
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    sex_id INT NOT NULL,
    country_id INT NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (sex_id) REFERENCES sex(sex_id),
    FOREIGN KEY (country_id) REFERENCES country(country_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Courses Table
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Enrollments Table (Many-to-Many between Students and Courses)
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    UNIQUE(student_id, course_id)
);


-- Insert Sample Data

-- Sex
INSERT INTO sex (label) VALUES ('Male'), ('Female'), ('Other');

-- Country
INSERT INTO country (name) VALUES ('Ethiopia'), ('Kenya'), ('USA');

-- Departments
INSERT INTO departments (name) VALUES ('Computer Science'), ('Business'), ('Engineering');

-- Students
INSERT INTO students (name, age, sex_id, country_id, department_id) VALUES
('Abel Tesfaye', 21, 1, 1, 1),
('Sofia Daniel', 22, 2, 1, 2),
('James Kim', 20, 1, 3, 1);

-- Courses
INSERT INTO courses (name, department_id) VALUES
('Database Systems', 1),
('Marketing 101', 2),
('Thermodynamics', 3);

-- Enrollments
INSERT INTO enrollments (student_id, course_id) VALUES
(1, 1),
(2, 2),
(3, 1),
(3, 3);