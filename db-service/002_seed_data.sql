-- =========================
-- CATEGORÍAS
-- =========================
INSERT INTO categories (name) VALUES
('Cemento'),
('Ladrillos'),
('Madera'),
('Pintura'),
('Herramientas');

-- =========================
-- PRODUCTOS
-- =========================
INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES
('Cemento Portland 50kg', 'Cemento Portland para construcción general', 7.50, 120, 1),
('Cemento rápido 25kg', 'Cemento de fraguado rápido', 5.20, 80, 1),
('Cemento rápido 50kg', 'Cemento rápido de alta resistencia', 9.00, 70, 1),
('Ladrillo macizo rojo', 'Ladrillo macizo para muros', 0.80, 500, 2),
('Ladrillo hueco', 'Ladrillo hueco para construcción ligera', 0.65, 400, 2),
('Bloque de hormigón 40x20x20', 'Bloque para muros estructurales', 1.20, 350, 2),
('Tablón de madera pino 2x10', 'Tablón de madera de pino de 2x10 cm', 15.00, 50, 3),
('Madera contrachapada 1m²', 'Madera contrachapada para encofrados', 12.50, 30, 3),
('Madera de roble 2x15', 'Tablón de roble natural', 22.00, 20, 3),
('Pintura acrílica blanca 10L', 'Pintura interior/exterior blanca', 25.00, 60, 4),
('Pintura esmalte azul 5L', 'Pintura esmalte para metal', 18.00, 40, 4),
('Pintura esmalte rojo 5L', 'Pintura esmalte para metal', 18.00, 40, 4),
('Barniz transparente 1L', 'Barniz para madera', 8.50, 45, 4),
('Martillo de carpintero', 'Martillo con mango de madera', 12.00, 25, 5),
('Taladro eléctrico 500W', 'Taladro con percusión', 55.00, 15, 5),
('Taladro percutor 700W', 'Taladro potente con percusión', 75.00, 12, 5),
('Destornillador juego 6 piezas', 'Destornilladores planos y Phillips', 10.00, 35, 5),
('Sierra manual 50cm', 'Sierra de mano', 18.00, 20, 5),
('Sierra circular 1200W', 'Sierra eléctrica potente', 80.00, 10, 5),
('Nivel láser', 'Nivel láser para precisión', 60.00, 8, 5),
('Cinta métrica 5m', 'Cinta métrica de acero', 5.00, 25, 5),
('Guantes de trabajo', 'Guantes de protección', 3.00, 50, 5),
('Lija 1000 grano', 'Lija fina para acabados', 3.00, 40, 5),
('Brocha 5cm', 'Brocha de cerda', 2.00, 50, 5),
('Rodillo pintura 20cm', 'Rodillo de espuma', 4.00, 30, 5),
('Clavos 1kg', 'Clavos de acero', 5.00, 100, 5),
('Tornillos 1kg', 'Tornillos de acero', 6.00, 80, 5),
('Mezcladora eléctrica 500W', 'Mezcladora para cemento y pintura', 120.00, 5, 5),
('Ladrillo caravista', 'Ladrillo visto de alta calidad', 1.50, 200, 2),
('Cemento blanco 50kg', 'Cemento blanco especial', 10.00, 60, 1);

-- =========================
-- CLIENTES
-- =========================
INSERT INTO customers (name, email, phone, address) VALUES
('Juan Pérez', 'juan.perez@example.com', '600123456', 'Calle Falsa 123, Madrid'),
('María Gómez', 'maria.gomez@example.com', '600234567', 'Av. del Sol 45, Barcelona'),
('Carlos Rodríguez', 'carlos.rodriguez@example.com', '600345678', 'Calle Luna 67, Valencia'),
('Ana López', 'ana.lopez@example.com', '600456789', 'Plaza Mayor 12, Sevilla'),
('Luis Fernández', 'luis.fernandez@example.com', '600567890', 'Calle Mayor 34, Bilbao'),
('Sofía Martínez', 'sofia.martinez@example.com', '600678901', 'Calle Jardín 9, Zaragoza'),
('Pedro Sánchez', 'pedro.sanchez@example.com', '600789012', 'Calle Río 56, Málaga'),
('Laura Díaz', 'laura.diaz@example.com', '600890123', 'Av. Andalucía 22, Granada'),
('Miguel Torres', 'miguel.torres@example.com', '600901234', 'Calle Mar 88, Alicante'),
('Elena Ramírez', 'elena.ramirez@example.com', '600012345', 'Calle Sol 10, Murcia');

-- =========================
-- ÓRDENES
-- =========================
INSERT INTO orders (customer_id, total_amount, status) VALUES
(1, 150.00, 'pendiente'),
(2, 200.00, 'pendiente'),
(3, 75.50, 'pendiente'),
(4, 320.00, 'pendiente'),
(5, 50.00, 'pendiente');

-- =========================
-- ITEMS DE ÓRDENES
-- =========================
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 10, 7.50),
(1, 14, 2, 12.00),
(2, 10, 4, 25.00),
(2, 15, 1, 55.00),
(3, 4, 50, 0.80),
(4, 29, 2, 10.00),
(4, 19, 3, 80.00),
(5, 25, 5, 5.00);
