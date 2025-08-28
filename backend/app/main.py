from fastapi import FastAPI
from .api.v1.auth import router as auth_router

app = FastAPI(title="AutoAudit Backend")

@app.get("/health")
def health():
    return {"status": "ok"}

app.include_router(auth_router)

@app.get("/")
def root():
    return {"message": "AutoAudit backend is running"}
