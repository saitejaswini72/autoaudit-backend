//imports fastapi framework which helps to create api's easily in python
from fastapi import FastAPI

app = FastAPI() // creates api instance which listens the incoming requests

@app.get("/")
def read_root():
    return {"message": "Backend setup is up and running!"}
