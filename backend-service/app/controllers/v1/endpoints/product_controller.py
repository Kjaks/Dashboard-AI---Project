from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from core.database import get_db
from schemas.product_schema import ProductCreate, ProductResponse
from services.product_service import create_product_service, list_products_service
from typing import List

router = APIRouter(prefix="/v1/products", tags=["Products"])

@router.post("/", response_model=ProductResponse)
def create_product(product: ProductCreate, db: Session = Depends(get_db)):
    return create_product_service(db, product)

@router.get("/", response_model=List[ProductResponse])
def get_products(db: Session = Depends(get_db)):
    return list_products_service(db)