# Clinic Booking System and Student Portal Project

This repository includes two parts:

- ✅ **Question 1**: SQL-only project to design and create the `Clinic Booking System` database.
- ✅ **Question 2**: Backend API for a `Student Portal` using FastAPI and MySQL.

---

## 📁 Contents

- [`question1_clinic.sql`](./clinic_booking.sql) – SQL script for Question 1 (Clinic Booking System)
- [`studentPortal/`](./studentPortal) – Full source code for Question 2 (Student Portal API)
- [`create_tables.sql`](./studentPortal/create_tables.sql) – SQL script to create database tables
- [`docs/erd.png`](./docs/erd.png) – Screenshot of the ERD (Entity Relationship Diagram)

---

## 🧠 Question 1: Clinic Booking System

This is a **MySQL database design** with well-structured tables and relationships for managing a clinic.

### ✅ Features

- Patients, Doctors, Appointments, Specializations
- Relational integrity through foreign keys
- Well-commented and organized SQL

### 📄 How to Use

1. Open MySQL or phpMyAdmin
2. Run the Question 1 `clinic_booking.sql` file

### 🖼️ ERD (Entity Relationship Diagram)

![ERD Screenshot](screenshot/question1-image.png)


---

## 💻 Question 2: Student Portal API (FastAPI + MySQL)

A backend CRUD API to manage student data.

### ✅ Features

- Add, view, update, and delete students
- FastAPI with SQLAlchemy ORM
- MySQL database integration
- Interactive Swagger UI

### 📦 Tech Stack

- Python 3.11+
- FastAPI
- SQLAlchemy
- MySQL
- Uvicorn

---
### 🖼️ ERD (Entity Relationship Diagram)

![ERD Screenshot](screenshot/question2-image.png)


## 🚀 How to Run Question 2 (Student Portal)

### 1. Clone the repo

```bash
git clone https://github.com/yourusername/student-portal-api.git
cd studentPortal

## Set up virtual environment (optional)
- python -m venv venv
- venv\Scripts\activate  # Windows

## Install dependencies
pip install -r requirements.txt

## Create database studentPortal
CREATE DATABASE studentPortal;

## Update database.py with your DB credentials:
DATABASE_URL = "mysql+pymysql://root:yourpassword@localhost:3306/student_portal"

## Run the FastAPI server
uvicorn app.main:app --reload
Go to:
- 📄 http://127.0.0.1:8000/docs – for Swagger UI
- 📄 http://127.0.0.1:8000 – for root endpoint


