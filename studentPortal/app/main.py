from fastapi import FastAPI
from fastapi.responses import HTMLResponse

from .routers import students  # Make sure this file and router exist
from . import models, database  # models.py and database.py should exist

# Create all tables in the database
models.Base.metadata.create_all(bind=database.engine)

# Create FastAPI app instance
app = FastAPI(title="Student Portal API")

# Include the students router
app.include_router(students.router)

# Root endpoint with HTML content
@app.get("/", response_class=HTMLResponse)
def read_root():
    return """
    <html>
        <head>
            <title>Student Portal API</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    padding: 40px;
                    background-color: #f4f4f4;
                }
                h1 {
                    color: #2c3e50;
                }
                a {
                    color: #2980b9;
                    text-decoration: none;
                }
            </style>
        </head>
        <body>
            <h1>🎓 Welcome to the Student Portal API</h1>
            <p>This is a backend service powered by FastAPI.</p>
            <p>You can view the interactive API docs at: <a href="/docs">/docs</a></p>
        </body>
    </html>
    """

