-- Mock data for order_items
INSERT IGNORE INTO order_items (id, order_id, item_id, price, quantity, status, date, notes, tenant_id) VALUES
(201, 201, 201, 15000, 1, 'preparing', NOW(), '', 100),
(202, 201, 202, 30000, 2, 'preparing', NOW(), '', 100),
(203, 201, 203, 45000, 1, 'preparing', NOW(), '', 100),
(204, 202, 202, 15000, 1, 'completed', NOW(), '', 100),
(205, 202, 203, 30000, 2, 'completed', NOW(), '', 100);
