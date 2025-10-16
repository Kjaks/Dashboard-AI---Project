from schemas.order_schema import OrderItemCreate, OrderCreate

def test_create_order_endpoint(client):
    order_data = {
        "customer_id": 1,
        "items": [
            {"product_id": 1, "quantity": 2, "unit_price": 10.0}
        ]
    }

    response = client.post("/v1/orders/", json=order_data)
    assert response.status_code == 200

    data = response.json()
    assert data["id"] is not None
    assert data["total_amount"] == 20.0
    assert len(data["items"]) == 1
    assert data["items"][0]["product_id"] == 1
