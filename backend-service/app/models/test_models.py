from sqlalchemy import Column, Integer, String, DECIMAL, TIMESTAMP, ForeignKey
from sqlalchemy.orm import relationship, declarative_base
from datetime import datetime

Base = declarative_base()

class Category(Base):
    __tablename__ = "categories"
    id = Column(Integer, primary_key=True)
    name = Column(String(100), nullable=False)

class Product(Base):
    __tablename__ = "products"
    id = Column(Integer, primary_key=True)
    name = Column(String(150), nullable=False)
    description = Column(String)
    price = Column(DECIMAL(10, 2), nullable=False)
    stock_quantity = Column(Integer, default=0)
    category_id = Column(Integer, ForeignKey("categories.id"))

class Customer(Base):
    __tablename__ = "customers"
    id = Column(Integer, primary_key=True)
    name = Column(String(150), nullable=False)
    email = Column(String(150))
    phone = Column(String(50))
    address = Column(String)

class Order(Base):
    __tablename__ = "orders"
    id = Column(Integer, primary_key=True)
    customer_id = Column(Integer, ForeignKey("customers.id"), nullable=False)
    order_date = Column(TIMESTAMP, default=datetime.utcnow)
    total_amount = Column(DECIMAL(10, 2), default=0)
    status = Column(String(50), default="pendiente")
    items = relationship("OrderItem", back_populates="order")

class OrderItem(Base):
    __tablename__ = "order_items"
    id = Column(Integer, primary_key=True)
    order_id = Column(Integer, ForeignKey("orders.id"), nullable=False)
    product_id = Column(Integer, ForeignKey("products.id"), nullable=False)
    quantity = Column(Integer, nullable=False)
    unit_price = Column(DECIMAL(10,2), nullable=False)
    order = relationship("Order", back_populates="items")
