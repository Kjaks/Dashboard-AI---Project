from sqlalchemy.orm import Session
from models.order_model import Order, OrderItem
from schemas.order_schema import OrderCreate

def create_order(db: Session, order_data: OrderCreate):
    total = sum(item.quantity * item.unit_price for item in order_data.items)
    order = Order(customer_id=order_data.customer_id, total_amount=total)
    db.add(order)
    db.commit()
    db.refresh(order)

    for item in order_data.items:
        order_item = OrderItem(
            order_id=order.id,
            product_id=item.product_id,
            quantity=item.quantity,
            unit_price=item.unit_price
        )
        db.add(order_item)

    db.commit()
    db.refresh(order)
    return order
