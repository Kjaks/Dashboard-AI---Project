from fastapi import FastAPI
from core.database import Base, engine
from models import product_model, category_model, order_model
from controllers.v1.endpoints import deepseek_controller, product_controller, order_controller

Base.metadata.create_all(bind=engine)

app = FastAPI(title="Tienda API v1")

app.include_router(deepseek_controller.router)
app.include_router(product_controller.router)
app.include_router(order_controller.router)
