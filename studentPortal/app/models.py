from sqlalchemy import Column, Integer, String, ForeignKey, Date
from sqlalchemy.orm import relationship
from .database import Base

from sqlalchemy.orm import relationship
from app.database import Base  

class Sex(Base):
    __tablename__ = "sex"
    sex_id = Column(Integer, primary_key=True, index=True)
    label = Column(String(10), unique=True, nullable=False)

class Country(Base):
    __tablename__ = "country"
    country_id = Column(Integer, primary_key=True, index=True)
    name = Column(String(100), unique=True, nullable=False)

class Department(Base):
    __tablename__ = "departments"
    department_id = Column(Integer, primary_key=True)
    name = Column(String(100), unique=True, nullable=False)

class Student(Base):
    __tablename__ = "students"
    student_id = Column(Integer, primary_key=True, index=True)
    name = Column(String(100), nullable=False)
    age = Column(Integer, nullable=False)
    sex_id = Column(Integer, ForeignKey("sex.sex_id"))
    country_id = Column(Integer, ForeignKey("country.country_id"))
    department_id = Column(Integer, ForeignKey("departments.department_id"))

class Course(Base):
    __tablename__ = "courses"
    course_id = Column(Integer, primary_key=True, index=True)
    name = Column(String(100), nullable=False)
    department_id = Column(Integer, ForeignKey("departments.department_id"))

class Enrollment(Base):
    __tablename__ = "enrollments"
    enrollment_id = Column(Integer, primary_key=True, index=True)
    student_id = Column(Integer, ForeignKey("students.student_id"))
    course_id = Column(Integer, ForeignKey("courses.course_id"))
    enrollment_date = Column(Date)

