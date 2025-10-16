from sqlalchemy.orm import Session
from repositories import order_repository
from schemas.order_schema import OrderCreate

def create_order_service(db: Session, order_data: OrderCreate):
    return order_repository.create_order(db, order_data)
