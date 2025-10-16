from pydantic import BaseModel
from typing import List
from datetime import datetime

class OrderItemCreate(BaseModel):
    product_id: int
    quantity: int
    unit_price: float

class OrderCreate(BaseModel):
    customer_id: int
    items: List[OrderItemCreate]

class OrderResponse(BaseModel):
    id: int
    customer_id: int
    total_amount: float
    status: str
    order_date: datetime
    class Config:
        from_attributes = True
