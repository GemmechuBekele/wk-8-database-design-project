-- Question 1:

-- Clinic Booking System Database
-- Created for DBMS Project
-- create database ClinicBookingSystem;

-- use ClinicBookingSystem;

-- Drop existing tables if needed
DROP TABLE IF EXISTS appointments, doctors, patients, specializations, users;

-- Users Table (for admin/reception login)
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role ENUM('admin', 'receptionist') NOT NULL
);

-- Specializations Table
CREATE TABLE specializations (
    specialization_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- Doctors Table
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialization_id INT,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    FOREIGN KEY (specialization_id) REFERENCES specializations(specialization_id)
);

-- Patients Table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    gender ENUM('male', 'female', 'other') NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL
);

-- Appointments Table
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Sample Data

-- Specializations
INSERT INTO specializations (name) VALUES ('Cardiology'), ('Dermatology'), ('Pediatrics');

-- Users
INSERT INTO users (username, password, role) VALUES
('admin1', 'securepassword', 'admin'),
('reception1', 'pass1234', 'receptionist');

-- Doctors
INSERT INTO doctors (name, specialization_id, email, phone) VALUES
('Dr. Alsan Girma', 1, 'alsan@clinic.com', '1234567890'),
('Dr. Gemmechu Bekele', 2, 'gemmechu@clinic.com', '0987654321');

-- Patients
INSERT INTO patients (name, dob, gender, phone) VALUES
('John Dalton', '1990-05-15', 'male', '1112223333'),
('Angela Yu', '1985-12-30', 'female', '4445556666');

-- Appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_date, reason) VALUES
(1, 1, '2025-05-08 08:00:00', 'Heart pain'),
(2, 2, '2025-05-15 12:30:00', 'Acne');



