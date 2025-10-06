from fastapi import FastAPI
from controllers.v1.endpoints import deepseek

app = FastAPI()

app.include_router(deepseek.router)
