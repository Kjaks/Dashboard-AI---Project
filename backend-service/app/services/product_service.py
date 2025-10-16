from sqlalchemy.orm import Session
from repositories import product_repository
from schemas.product_schema import ProductCreate

def create_product_service(db: Session, product_data: ProductCreate):
    return product_repository.create_product(db, product_data)

def list_products_service(db: Session):
    return product_repository.get_all_products(db)
