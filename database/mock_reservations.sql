-- Mock data for reservations
INSERT IGNORE INTO reservations (id, customer_id, date, table_id, status, notes, people_count, unique_code, tenant_id) VALUES
(201, '0911000002', NOW() + INTERVAL 1 DAY, 202, 'pending', 'Kỷ niệm sinh nhật', 4, 'RESV17793308680791', 100),
(202, '0911000003', NOW() + INTERVAL 2 DAY, 203, 'confirmed', 'Kỷ niệm sinh nhật', 4, 'RESV17793308680792', 100);
