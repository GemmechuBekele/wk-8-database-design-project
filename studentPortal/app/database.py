from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# Replace 'yourusername' and 'yourpassword' with your actual MySQL credentials
DATABASE_URL = "mysql+pymysql://root:Gemme7@localhost:3306/student_portal"

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(bind=engine, autoflush=False, autocommit=False)
Base = declarative_base()
