from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from core.database import get_db
from schemas.order_schema import OrderCreate, OrderResponse
from services.order_service import create_order_service

router = APIRouter(prefix="/v1/orders", tags=["Orders"])

@router.post("/", response_model=OrderResponse)
def create_order(order: OrderCreate, db: Session = Depends(get_db)):
    return create_order_service(db, order)
