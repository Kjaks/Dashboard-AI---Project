from sqlalchemy import Column, Integer, ForeignKey, String, DECIMAL, TIMESTAMP
from sqlalchemy.orm import relationship
from datetime import datetime
from core.database import Base

class Order(Base):
    __tablename__ = "orders"

    id = Column(Integer, primary_key=True, index=True)
    customer_id = Column(Integer, ForeignKey("customers.id"), nullable=False)
    order_date = Column(TIMESTAMP, default=datetime.utcnow)
    total_amount = Column(DECIMAL(10, 2), default=0)
    status = Column(String(50), default="pendiente")

    items = relationship("OrderItem", back_populates="order")


class OrderItem(Base):
    __tablename__ = "order_items"

    id = Column(Integer, primary_key=True, index=True)
    order_id = Column(Integer, ForeignKey("orders.id"), nullable=False)
    product_id = Column(Integer, ForeignKey("products.id"), nullable=False)
    quantity = Column(Integer, nullable=False)
    unit_price = Column(DECIMAL(10, 2), nullable=False)

    order = relationship("Order", back_populates="items")
