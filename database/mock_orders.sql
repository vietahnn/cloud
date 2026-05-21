-- Mock data for orders
INSERT IGNORE INTO orders (id, date, delivery_type, customer_type, customer_id, table_id, status, token_no, payment_status, invoice_id, tenant_id) VALUES
(201, NOW() - INTERVAL 15 DAY, 'Dine-in', 'CUSTOMER', '0911000002', 202, 'completed', 1, 'paid', 201, 100),
(202, NOW() - INTERVAL 12 DAY, 'Dine-in', 'CUSTOMER', '0911000003', 203, 'cancelled', 2, 'paid', 202, 100),
(203, NOW() - INTERVAL 8 DAY, 'Dine-in', 'CUSTOMER', '0911000004', 204, 'created', 3, 'paid', 203, 100),
(204, NOW() - INTERVAL 23 DAY, 'Dine-in', 'CUSTOMER', '0911000005', 205, 'completed', 4, 'paid', 204, 100),
(205, NOW() - INTERVAL 19 DAY, 'Dine-in', 'CUSTOMER', '0911000006', 201, 'cancelled', 5, 'paid', 205, 100);
