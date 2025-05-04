from pydantic import BaseModel
from datetime import date

class StudentBase(BaseModel):
    name: str
    age: int
    sex_id: int
    country_id: int
    department_id: int

class StudentCreate(StudentBase):
    pass

class Student(StudentBase):
    student_id: int
    class Config:
        orm_mode = True

class CourseBase(BaseModel):
    name: str
    department_id: int

class CourseCreate(CourseBase):
    pass

class Course(CourseBase):
    course_id: int
    class Config:
        orm_mode = True

class EnrollmentBase(BaseModel):
    student_id: int
    course_id: int
    enrollment_date: date

class EnrollmentCreate(EnrollmentBase):
    pass

class Enrollment(EnrollmentBase):
    enrollment_id: int
    class Config:
        orm_mode = True
